module ApplicationHelper
  def active?(character)
    return "" if @character.nil?
    @character.id == character.id ? "active" : ""
  end
end
