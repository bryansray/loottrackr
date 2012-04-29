# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'date'

clete = Character.create({name: "Clete", clazz: "Hunter"})
ganvil = Character.create({name: "Ganvil", clazz: "Shaman"})
kakana = Character.create({name: "Kakana", clazz: "Priest"})
kazuhiro = Character.create({name: "Kazuhiro", clazz: "Warrior"})
keljahl = Character.create({name: "Keljahl", clazz: "Priest"})
mischi = Character.create({name: "Mischi", clazz: "Mage"})
thundersnow = Character.create({name: "Thundersnow", clazz: "Mage"})
urielle = Character.create({name: "Urielle", clazz: "Rogue"})
valarian = Character.create({name: "Valarian", clazz: "Paladin"})

virtual = Character.create({name: "Virtual", clazz: "Paladin"})
virtual.equipped_items.create({name: "Faceguard of Radiant Glory", :level => 397})
virtual.equipped_items.create({name: "Guardspike Choker", :level => 397})
virtual.equipped_items.create({name: "Indefatigable Greatcloak", :level => 397})
virtual.equipped_items.create({name: "Chestguard of Radiant Glory", :level => 397})
virtual.equipped_items.create({name: "Titanguard Wristplates", :level => 397})
virtual.equipped_items.create({name: "Handguards of Radiant Glory", :level => 397})
virtual.equipped_items.create({name: "Forgesmelter Waistplate", :level => 397})
virtual.equipped_items.create({name: "Legguards of Radiant Glory", :level => 410})
virtual.equipped_items.create({name: "Bladeshatter Treads", :level => 397})
virtual.equipped_items.create({ name: "Signet of the Resolute", :level => 397})
virtual.equipped_items.create( {name: "Adamantine Signet of the Avengers", :level => 391})
virtual.equipped_items.create( {name: "Indomitable Pride", :level => 397 })
virtual.equipped_items.create( {name: "Soulshifter Vortex", :level => 410 })
virtual.equipped_items.create({name: "Blackhorn's Mighty Bulwark", :level => 397})
virtual.equipped_items.create({name: "Stoutheart Talisman", :level => 397})


felania = Character.create({name: "Felania", clazz: "Death Knight"})

i = Item.create({name: "Petrified Fungal Heart", :level => 410, :wowhead_id => "78364"})
l = Loot.create({character: kakana, item: i, received_on: Date.new(2012, 4, 22), :equipped => true})

i = Item.create({name: "Robe of Glowing Stone", :level => 410, :wowhead_id => "78365"})
l = Loot.create({character: kakana, item: i,  received_on: Date.new(2012, 4, 8), equipped: true})

i = Item.create({name: "Janglespur Jackboots", level: 410, :wowhead_id => "78449"})
l = Loot.create({character: nil, item: i, received_on: Date.new(2012, 4, 9)})

i = Item.create({name: "Belt of Flayed Skin", level: 410, :wowhead_id => "78388"})
l = Loot.create({character: nil, item: i, received_on: Date.new(2012, 4, 12)})
l = Loot.create({character: nil, item: i, received_on: Date.new(2012, 4, 12)})

i = Item.create({name: "Shadow Wing Armbands", level: 410, :wowhead_id => "78446"})
l = Loot.create({character: nil, item: i, received_on: Date.new(2012, 4, 23)})

i = Item.create({name: "Mindstrainer Treads", level: 410, :wowhead_id => "78405"})
l = Loot.create({character: ganvil, item: i, received_on: Date.new(2012, 4, 8)})

i = Item.create({name: "Treads of Dormant Dreams", level: 410, :wowhead_id => "78415"})
l = Loot.create({character: clete, item: i, received_on: Date.new(2012, 4, 8), equipped: true})

i = Item.create({name: "Belt of Shattered Elementium", level: 410, :wowhead_id => "78463"})
l = Loot.create({character: nil, item: i, received_on: Date.new(2012, 4, 9)})

i = Item.create({name: "Bracers of Looming Darkness", level: 410, :wowhead_id => "78430"})
l = Loot.create({character: ganvil, item: i, received_on: Date.new(2012, 4, 8)})

i = Item.create({name: "Girdle of Shattered Stone", level: 410, :wowhead_id => "78370"})
l = Loot.create({character: nil, item: i, received_on: Date.new(2012, 4, 15)})

i = Item.create({name: "Finger of Zon'ozz", level: 410, :wowhead_id => "78392"})
l = Loot.create({character: mischi, item: i, received_on: Date.new(2012, 4, 8)})

i = Item.create({name: "Wrath of Unchaining", level: 410, :wowhead_id => "77994"})
l = Loot.create({character: nil, item: i, received_on: Date.new(2012, 4, 9)})
l = Loot.create({character: nil, item: i, received_on: Date.new(2012, 4, 23)})

i = Item.create({name: "Goblet of Anger", level: 391, :wowhead_id => "71448"})
l = Loot.create({character: keljahl, item: i, received_on: Date.new(2012, 4, 9), equipped: true})

i = Item.create({name: "Insignia of the Corrupted Mind", level: 410, :wowhead_id => "77991"})
l = Loot.create({character: kakana, item: i, received_on: Date.new(2012, 4, 22)})
l = Loot.create({character: thundersnow, item: i, received_on: Date.new(2012, 4, 15)})
l = Loot.create({character: mischi, item: i})

i = Item.create({name: "Brackenshell Shoulderplates", level: 410, :wowhead_id => "78367"})
l = Loot.create({character: virtual, item: i, received_on: Date.new(2012, 4, 15), equipped: true})

i = Item.create({name: "Dragonfracture Belt", level: 410, :wowhead_id => "78436"})
l = Loot.create({character: valarian, item: i, received_on: Date.new(2012, 4, 16)})

i = Item.create({name: "Gauntlets of the Golden Thorn", level: 397, :wowhead_id => "77235"})
l = Loot.create({character: valarian, item: i, received_on: Date.new(2012, 4, 23)})

i = Item.create({name: "Leggings of the Corrupted Conquerer", level: 410, :wowhead_id => "78856"})
l = Loot.create({character: virtual, item: i, received_on: Date.new(2012, 4, 8), equipped: true})

i = Item.create({name: "Gauntlets of the Corrupted Vanquisher", level: 410, :wowhead_id => "78855"})
l = Loot.create({character: kazuhiro, item: i, received_on: Date.new(2012, 4, 15)})
l = Loot.create({character: mischi, item: i, received_on: Date.new(2012, 4, 8)})

i = Item.create({name: "Shoulders of the Corrupted Protector", level: 410, :wowhead_id => "78860"})
l = Loot.create({character: kazuhiro, item: i, received_on: Date.new(2012, 4, 8)})

i = Item.create({name: "Crown of the Corrupted Protector", level: 410, :wowhead_id => "78851"})
l = Loot.create({character: kazuhiro, item: i, received_on: Date.new(2012, 4, 9), equipped: true})

i = Item.create({name: "Leggings of the Corrupted Protector", level: 410, :wowhead_id => "78857"})
l = Loot.create({character: ganvil, item: i, received_on: Date.new(2012, 4, 22)})
l = Loot.create({character: kazuhiro, item: i, received_on: Date.new(2012, 4, 15)})

i = Item.create({name: "Chest of the Corrupted Vanquisher", level: 410, :wowhead_id => "78849"})
l = Loot.create({character: urielle, item: i, received_on: Date.new(2012, 4, 8)})

i = Item.create({name: "Chest of the Corrupted Conquerer", level: 410, :wowhead_id => "78847"})
l = Loot.create({character: keljahl, item: i, received_on: Date.new(2012, 4, 23)})

i = Item.create({name: "Crown of the Corrupted Conquerer", level: 397, :wowhead_id => "78850"})
l = Loot.create({character: virtual, item: i, received_on: Date.new(2012, 4, 23)})
l = Loot.create({character: keljahl, item: i, received_on: Date.new(2012, 4, 16)})

i = Item.create({name: "Gauntlets of the Corrupted Protector", level: 410, :wowhead_id => "78854"})
l = Loot.create({character: ganvil, item: i, received_on: Date.new(2012, 4, 22)})

i = Item.create({name: "Souldrinker", level: 403, :wowhead_id => "77193"})
l = Loot.create({character: virtual, item: i, received_on: Date.new(2012, 4, 9)})

i = Item.create({name: "No'Kaled, the Elements of Death", level: 403, :wowhead_id => "77188"})
l = Loot.create({character: nil, item: i, received_on: Date.new(2012, 4, 9)})

i = Item.create({name: "Hand of Morchok", level: 410, :wowhead_id => "78371"})
l = Loot.create({character: nil, item: i, received_on: Date.new(2012, 4, 8)})
l = Loot.create({character: felania, item: i, received_on: Date.new(2012, 4, 23)})
l = Loot.create({character: kazuhiro, item: i})
l = Loot.create({character: virtual, item: i})

i = Item.create({name: "Ti'tahk, the Steps of Time", level: 403, :wowhead_id => "77190"})
l = Loot.create({character: kakana, item: i, received_on: Date.new(2012, 4, 23)})

i = Item.create({name: "Gurthalak, Voice of the Deeps", level: 403, :wowhead_id => "77191"})
l = Loot.create({character: felania, item: i, received_on: Date.new(2012, 4, 23)})

i = Item.create({name: "Goriana's Collar", :level => 397, :wowhead_id => "77239"})
l = Loot.create({character: kazuhiro, item: i, received_on: Date.new(2012, 4, 16)})