class AfterSignupController < ApplicationController
  include Wicked::Wizard  
  steps :account, :setting, :billing

  def show
    @user = current_user

    case step
    when :account
      @account = Account.find_or_initialize_by_user_id @user.id

      if @account
        @provider = Provider.find_or_initialize_by_account_id(@account.id)
        return redirect_to wizard_path(:setting)
      end
    end

    case step
    when :setting
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
        @account = Account.find_or_initialize_by_user_id @user.id

        if @account
          @provider = Provider.find_or_initialize_by_account_id(@account.id)
          return redirect_to wizard_path(:setting)
        end
        
        @account.name = type

        if @account.save
          @user.account = @account
          @user.save!
          
          @provider = Provider.find_or_initialize_by_account_id(@account.id)
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
end
