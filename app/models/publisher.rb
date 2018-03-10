class Publisher < ApplicationRecord
  mount_uploader :image, PublisherCoverUploader

	extend FriendlyId

	friendly_id :name, use: :slugged

	validates_presence_of :name, :slug

	has_many :titles

  def maybe_you_would_like title_id, number_of_titles=4
    titles.where.not(id: title_id).limit(number_of_titles)
  end
end
