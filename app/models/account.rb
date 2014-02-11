class Account < ActiveRecord::Base
  belongs_to :user,
    validate: true,
    autosave: true

  has_many :users,
    dependent: :delete_all
end
