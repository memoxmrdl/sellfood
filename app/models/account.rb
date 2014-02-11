class Account < ActiveRecord::Base
  belongs_to :user,
    validate: true,
    autosave: true

  has_many :users,
    dependent: :destroy_all
end
