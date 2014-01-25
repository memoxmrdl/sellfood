require 'spec_helper'

describe Address do
  it { should belong_to :provider }
end
