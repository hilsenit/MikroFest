class Publisher < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :image, PublisherCoverUploader

	extend FriendlyId

	friendly_id :name, use: :slugged

  paginates_per 12

	validates_presence_of :name, :slug

	has_many :titles
  has_many :mikrograms

  def maybe_you_would_like title_id, number_of_titles=4
    titles.where.not(id: title_id).limit(number_of_titles)
  end
end
