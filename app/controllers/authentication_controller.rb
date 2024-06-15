class AuthenticationController < ApplicationController
  def login
    render layout: "authentication_layout"  
  end

  def register
  end

  def signin 
    redirect_to root_path
  end
end
