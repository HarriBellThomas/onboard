class House < ActiveRecord::Base
	has_attached_file :image, default_url: "missing.png"
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

	has_many :orders
	belongs_to :user

	geocoded_by :address  # can also be an IP address
	after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

	validates :latitude, presence: true
	validates :longitude, presence: true
end

