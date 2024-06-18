class AuthenticationController < ApplicationController
  def login
    render layout: "authentication_layout"  
  end

  def register
    render layout: "authentication_layout"
  end

  def signin 
    redirect_to root_path
  end

  def create 
    redirect_to root_path
  end
end
