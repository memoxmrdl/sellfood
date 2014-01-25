class Food < ActiveRecord::Base
  belongs_to :provider
  has_many :order_details
end
