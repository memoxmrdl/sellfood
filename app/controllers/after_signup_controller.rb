class AfterSignupController < ApplicationController
  include Wicked::Wizard  
  steps :account, :config, :billing

  def show
    @user = current_user

    case step
    when :account
      @account = Account.find_or_initialize_by_user_id @user.id
    end

    case step
    when :billing
    end

    render_wizard
  end

  def update
  end
end
