require 'spec_helper'

describe Food do
  it { should belong_to :provider }
  it { should have_many :order_details }
end
