class Favorite < ApplicationRecord
  belongs_to :user, foreign_key: :user_id
  belongs_to :title, foreign_key: :title_id

  validates_uniqueness_of :title_id, scope: :user_id, errors: "Du kan ikke gemme den samme titel to gange"
end
