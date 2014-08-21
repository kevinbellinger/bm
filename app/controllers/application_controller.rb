class ApplicationController < ActionController::Base

   def hello
     render text: "<h1>Hello</h1><p>Welcome home</p>"
   end

  def ensure_signup_complete

    return if action_name == 'finish_signup'


    if current_user && !current_user.email_verified?
      redirect_to finish_signup_path(current_user)
    end
  end
end