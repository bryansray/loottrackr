module CharactersHelper
  def loot_styles(item)
    "heroic" if item.heroic?    
  end
end
