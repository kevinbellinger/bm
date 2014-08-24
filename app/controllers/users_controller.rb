class UsersController < ApplicationController
  # before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show]
  
  def show
    @user = User.find(params[:id])
    @bookmarks = @user.bookmarks
    @comments = @user.comments

  end

  def edit
  end

  def update
    if current_user.update_attributes(user_params)
      flash[:notice] = "User information updated"
      redirect_to edit_user_registration_path(current_user)
    else
      render "devise/registrations/edit"
    end
  end


  def finish_signup

    if request.patch? && params[:user] 
      if current_user.update_attributes(user_params)
       #current_user.skip_reconfirmation!
       #sign_in(@user, :bypass => true)
       flash[:notice] = "Your profile was successfully updated"
       redirect_to bookmarks_path
        #adding welcome mail
       # UserMailer.welcome_email(@user).deliver_later
      else
        @show_errors = true
      end
    end
  end

  def destroy

    @user.destroy
    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end
  
  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    accessible = [ :name, :email, :avatar ]
    accessible << [ :password, :password_confirmation ] unless params[:user][:password].blank?
    params.require(:user).permit(accessible)
  end
end