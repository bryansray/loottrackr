class CharactersController < ApplicationController
  def show
    @character = Character.find(params[:id])
    @recent_loot = @character.loots.where("received_on IS NOT NULL").order("received_on DESC")
  end
end
