class ItemsController < ApplicationController
  def show
    @item = Item.find(params[:id])
    @loots = Loot.where("item_id = ?", @item.id)
  end
end
