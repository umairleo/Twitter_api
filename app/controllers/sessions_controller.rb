class SessionsController < ApplicationController
    def sign_up
      @user = User.new(sign_up_params)
      if @user.save
        success_user_created
      else
        error_user_save
      end
    end
  
    def sign_in; end
  
    def sign_out; end
  
    protected
  
    def success_user_created
      render status: :created, template: 'sessions/show.json.jbuilder'
    end
  
    def error_user_save
      render status: :unprocessable_entity, json: { errors: @user.errors.full_messages }
    end
  
    private
  
    def sign_up_params
      params.permit(:email, :name, :password, :username, :bio)
    end
  end