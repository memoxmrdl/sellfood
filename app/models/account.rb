class Account < ActiveRecord::Base
  belongs_to :user
  has_one :provider
end
