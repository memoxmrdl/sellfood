require 'spec_helper'

describe Order do
  it { should belong_to :user }
  it { should belong_to :provider }
  it { should have_many :order_details }
  it { should have_many :users }
end
