class Publisher < ApplicationRecord
  mount_uploader :image, PublisherCoverUploader

	extend FriendlyId

	friendly_id :name, use: :slugged

	validates_presence_of :name, :slug

	has_many :titles
end
