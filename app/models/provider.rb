class Provider < ActiveRecord::Base
  belongs_to :account
  has_many :foods
  has_many :orders
  has_many :addresses
end