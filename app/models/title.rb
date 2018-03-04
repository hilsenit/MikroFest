class Title < ApplicationRecord
  mount_uploader :image, TitleImageUploader
	extend FriendlyId
	friendly_id :title, use: :slugged

  has_many :reviews, inverse_of: :title
  has_many :favorites, inverse_of: :title
	belongs_to :publisher

  accepts_nested_attributes_for :reviews, reject_if: :all_blank, allow_destroy: true
	validates_presence_of :title, :slug

end
