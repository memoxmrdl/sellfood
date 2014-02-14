class AfterSignupController < ApplicationController
  include Wicked::Wizard  
  steps :account, :setting, :billing

  def show
    @user = current_user

    case step
    when :account
      @account = Account.find_or_initialize_by_user_id @user.id

      user_have_account_then_redirect :setting
    end

    case step
    when :setting
      type_account = current_user.account.name

      if  type_account.eql?('consumer')        
        @user = User.find(@user.id)
        @user.build_address
      elsif type_account.eql?('seller')
        @provider = Provider.find_or_initialize_by_account_id(current_user.account.id)
      end          
    end

    case step
    when :billing
    end

    render_wizard
  end

  def update
    @user = current_user

    case step
    when :account     
      type = params[:type]

      if type.include?('consumer') || type.include?('seller')
        user_have_account_then_redirect :setting
        @account = Account.find_or_initialize_by_user_id @user.id     
        @account.name = type

        if @account.save
          @user.account = @account
          @user.save          
          redirect_to wizard_path :setting
        else
          redirect_to wizard_path(:account), alert: 'Hubo problemas al crear la cuenta'
        end
      else
        redirect_to wizard_path(:account), alert: 'Error al eligir una cuenta'
      end
    end

    case step
    when :setting
    end

    case step
    when :billing
    end
  end

  private
  def user_have_account_then_redirect(step)
    return jump_to(step) if current_user.account.present?
  end
end
