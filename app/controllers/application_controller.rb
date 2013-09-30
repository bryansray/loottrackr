class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :get_characters

  def get_characters
    @characters = Character.where(:main => true).order("clazz,name")
  end
end
