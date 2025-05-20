class SessionsController < ApplicationController
  def new
    # render login form in sessions/new.html.erb
  end

  def create
    @user = User.find_by({"email" => params["email"]})
  
    if @user != nil 
      if @user["password"] == params["password"]
        flash["notice"] = "Welcome back."
        redirect_to "/companies" and return
      end
    end
  
    flash["notice"] = "Invalid email or password."
    redirect_to "/login"
  end
  

  def destroy
    # logout the user
    flash["notice"] = "Goodbye."
    redirect_to "/login"
  end
end
