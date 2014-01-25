require 'spec_helper'

describe OrderDetail do
  it { should belong_to :user }
  it { should belong_to :order }
  it { should belong_to :food }
end
