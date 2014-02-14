class Address < ActiveRecord::Base
  belongs_to :provider
  belongs_to :user
end
