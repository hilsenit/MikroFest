class Mikrogram < ApplicationRecord
  belongs_to :publisher

  validates_presence_of :title, :description
end
