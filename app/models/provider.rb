class Provider < ActiveRecord::Base
  belongs_to :user
  has_many :foods
  has_many :orders
  has_many :addresses
end