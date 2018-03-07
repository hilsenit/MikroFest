class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  validates_presence_of :email, :address, :favorite_word

  has_many :favorites, inverse_of: :title
  has_many :credit_cards, dependent: :destroy

  after_commit :assign_customer_id, on: :create

  def assign_customer_id # For Stripe - saving users to their platform
    customer = Stripe::Customer.create(email: email)
    self.customer_id = customer.id
  end

end
