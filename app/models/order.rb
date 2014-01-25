class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :provider
  has_many :order_details, dependent: :delete_all
  has_many :users, through: :order_details
end
