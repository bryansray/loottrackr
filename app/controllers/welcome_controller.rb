class WelcomeController < ApplicationController
  def index
    @recent_loot = Loot.order("received_on DESC").limit(10)
  end
end
