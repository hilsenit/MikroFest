class User < ApplicationRecord
  validates_presence_of :full_name, :email, :address, :phone_number
end
