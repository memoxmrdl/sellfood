class AfterSignupController < ApplicationController
  include Wicked::Wizard
  
  steps :setup, :billing

  def show
  end

  def update
  end
end
