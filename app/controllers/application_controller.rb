class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :get_characters

  def get_characters
    @characters = Character.order("name")
  end
end
