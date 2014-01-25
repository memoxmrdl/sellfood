require 'spec_helper'

describe Provider do
  it { should belong_to :user }
  it { should have_many :foods }
  it { should have_many :orders }
  it { should have_many :addresses }
end
