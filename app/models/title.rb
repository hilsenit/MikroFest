class Title < ApplicationRecord
	extend FriendlyId
	friendly_id :title, use: :slugged

	belongs_to :publisher

	validates_presence_of :title, :slug
end
