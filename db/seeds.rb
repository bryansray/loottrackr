# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'date'

def create_and_equip_for_character(i, character)
    item = Item.find_by_name_and_level(i[:name], i[:level]) 
    item = Item.create({name: i[:name], slot: i[:slot], level: i[:level], :wowhead_id => i[:wowhead_id]}) if item.nil?
    i[:main] = true if i[:main].nil?
    loot = Loot.new({character: character, item: item, equipped: i[:equipped], received_on: i[:received_on], main: i[:main]})
    loot.save if loot.valid?
end

morchok = Boss.create({name: "Morchok"})
morchok.items.create({name: "Bone-Link Fetish", level: 397, wowhead_id: "77210"})
morchok.items.create({name: "Bone-Link Fetish", level: 410, wowhead_id: "78002"})

morchok.items.create({name: "Brackenshell Shoulderplates", level: 397, wowhead_id: "77268", slot: "Shoulder", item_type: "Plate"})
morchok.items.create({name: "Brackenshell Shoulderplates", level: 410, wowhead_id: "78367", slot: "Shoulder", item_type: "Plate"})


morchok.items.create({name: "Petrified Fungal Heart", level: 397, wowhead_id: "77262"})
morchok.items.create({name: "Petrified Fungal Heart", level: 410, wowhead_id: ""})

zonozz = Boss.create({name: "Warlord Zon'ozz"})
yorsahj = Boss.create({name: "Yor'sahj the Unsleeping"})
hagara = Boss.create({name: "Hagara the Stormbinder"})
ultraxion = Boss.create({name: "Ultraxion"})
warmaster = Boss.create({name: "Warmaster Blackhorn"})
spine = Boss.create({name: "Spine of Deathwing"})
madness = Boss.create({name: "Madness of Deathwing"})

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
felania = Character.create({name: "Felania", clazz: "Death Knight"})
voltec = Character.create({name: "Voltec", clazz: "Mage", main: false})
relaeha = Character.create({name: "Relaeha", clazz: "Priest", main: false})

[{name: "Razor Saronite Chip", level: 410, wowhead_id: "78369", disenchanted: true, received_on: Date.new(2012, 4, 29), equipped: false},
{name: "Scalpel of Unrelenting Agony", character: mischi, level: 410, wowhead_id: "", received_on: Date.new(2012, 4, 30), equipped: false},
{name: "Leggings of the Corrupted Conquerer", level: 410, character: kakana, wowhead_id: "", received_on: Date.new(2012, 4, 30), equipped: true},
{name: "Gauntlets of the Corrupted Vanquisher", character: felania, level: 410, wowhead_id: "", received_on: Date.new(2012, 4, 30), equipped: true},
{name: "Seal of the Seven Signs", level: 410, character: keljahl, wowhead_id: "", received_on: Date.new(2012, 4, 30), equipped: true},
{name: "Lightning Rod", level: 410, character: voltec, wowhead_id: "", received_on: Date.new(2012, 4, 30), equipped: true},
{name: "Shoulders of the Corrupted Protector", level: 410, character: clete, wowhead_id: "", received_on: Date.new(2012, 4, 30), equipped: true},
{name: "Curled Twilight Claw", level: 410, character: valarian, wowhead_id: "", received_on: Date.new(2012, 4, 30), equipped: true},
{name: "Chest of the Corrupted Protector", level: 410, character: clete, wowhead_id: "", received_on: Date.new(2012, 4, 30), equipped: true},
{name: "Eye of Unmaking", level: 397, character: felania, wowhead_id: "", received_on: Date.new(2012, 4, 30), equipped: false},
{name: "Gauntlets of the Golden Thorn", level: 397, wowhead_id: "", received_on: Date.new(2012, 4, 30), equipped: false, disenchanted: true},
{name: "Blackhorn's Mighty Bulwark", level: 397, character: valarian, wowhead_id: "", received_on: Date.new(2012, 4, 30), equipped: false},
{name: "Gurthalak, Voice of the Deeps", level: 397, wowhead_id: "", received_on: Date.new(2012, 4, 30), equipped: false, disenchanted: true},
{name: "Rathrak, the Poisonous Mind", level: 397, wowhead_id: "", received_on: Date.new(2012, 4, 30), equipped: false, disenchanted: true},
{name: "Crown of the Corrupted Conquerer", level: 397, character: relaeha, wowhead_id: "", received_on: Date.new(2012, 4, 30), equipped: false}
].each do |i|
  create_and_equip_for_character(i, i[:character])
end


# Clete
[
  {name: "Wyrmstalker's Headguard", :level => 397, :equipped => true },
  {name: "Cameo of Terrible Memories", :level => 397, :equipped => true},
  {name: "Wyrmstalker's Spaulders", :level => 397, :equipped => false},
  {name: "Batwing Cloak", :level => 397, :equipped => true},
  {name: "Wyrmstalker's Tunic", :level => 410, :equipped => false},
  {name: "Bracers of Looming Darkness", :level => 410, :wowhead_id => "78430", :equipped => true},
  {name: "Sporebeard Gauntlets", :level => 410, :equipped => true},
  {name: "Belt of the Beloved Companion", :level => 397, :equipped => true},
  {name: "Wyrmstalker's Legguards", :level => 410, :equipped => true},
  {name: "Treads of Dormant Dreams", :level => 410, :wowhead_id => "78415", :equipped => true, :received_on => Date.new(2012, 4, 8) },
  {name: "Emergency Descent Loop", :level => 397, :equipped => true},
  {name: "Signet of Grasping Mouths", :level => 397, :equipped => true},
  {name: "Wrath of Unchaining", :level => 403, :wowhead_id => "77994", :equipped => true},
  {name: "Starcatcher Compass", :level => 397, :equipped => true},
  {name: "Horrifying Horn Arbalest", :level => 410, :equipped => true},
  {name: "Spire of Coagulated Globules", :level => 410, :equipped => true}
  ].each do |i|
    create_and_equip_for_character(i, clete)
  end

# Ganvil
[
  {name: "Spiritwalker's Facegard", :level => 397, :equipped => true},
  {name: "Petrified Fungal Heart", :level => 384, :equipped => true},
  {name: "Imperfect Specimens 27 and 28", :level => 410, :equipped => true},
  {name: "Woundlicker Cover", :level => 397, :equipped => true},
  {name: "Spiritwalker's Tunic", :level => 410, :equipped => true},
  {name: "Groteesquely Writhing Bracers", :level => 410, :equipped => true},
  {name: "Spiritwalker's Handwraps", :level => 410, :equipped => true},
  {name: "Girdle of Shamanic Fury", :level => 397, :equipped => true},
  {name: "Spiritwalker's Legwraps", :level => 410, :equipped => true},
  {name: "Mindstrainer Treads", :level => 410, :wowhead_id => "78405", :equipped => true, :received_on => Date.new(2012, 4, 8)},
  {name: "Ring of the Riven", :level => 397, :equipped => true},
  {name: "Band of Reconstruction", :level => 397, :equipped => true},
  {name: "Seal of the Seven Signs", :level => 397, :equipped => true},
  {name: "Heart of Unliving", :level => 390, :equipped => true},
  {name: "Lightning Spirit in a Bottle", :level => 397, :equipped => true},
  {name: "Vagariename: Timepiece of the Broze Flight", :level => 384, :equipped => true},
  
  {name: "Bracers of Looming Darkness", :level => 410, :equipped => false, :received_on => Date.new(2012, 4, 8) },
  {name: "Gauntlets of the Fiery Protector", level: 410, :equipped => false, received_on: Date.new(2012, 4, 22) },
  {name: "Leggings of the Corrupted Protector", level: 410, equipped: false, received_on: Date.new(2012, 4, 22) },
  {name: "Chest of the Corrupted Protector", level: 410, equipped: false, received_on: Date.new(2012, 4, 22) },
  {name: "Morningstar of Heroic Will", level: 410, equipped: false, received_on: Date.new(2012, 4, 22) }
].each do |i|
    create_and_equip_for_character(i, ganvil)
  end

# Kakana
[
  {:name => "Cowl of Dying Light", :level => 397, :equipped => true},
  {:name => "Petrified Fungal Heart", :level => 410, :wowhead_id => "78364", received_on: Date.new(2012, 4, 22), :equipped => true},
  {:name => "Mantle of Dying Light", :level => 397, :equipped => true},
  {:name => "Woundlicker Cover", :level => 397, :equipped => true},
  {:name => "Robe of Glowing Stone", :level => 410, :wowhead_id => "78365", :equipped => true, received_on: Date.new(2012, 4, 8) },
  {:name => "Dreamwraps of the Light", :level => 397, :equipped => true},
  {:name => "Handwraps of Dying Light", :level => 410, :equipped => true},
  {:name => "Cord of the Slain Champion", :level => 397, :equipped => true},
  {:name => "Leggings of Dying Light", :level => 397, :equipped => false},
  {:name => "Janglespur Jackboots", :level => 397, :wowhead_id => "78449", :equipped => true},
  {:name => "Ring of the Riven", :level => 397, :equipped => true},
  {:name => "Band of Reconstruction", :level => 397, :equipped => true},
  {:name => "Seal of the Seven Signs", :level => 410, :equipped => true},
  {:name => "Windward Heart", :level => 397, :equipped => true},
  {:name => "Vagaries of Time", :level => 410, :equipped => true},
  {:name => "Goblet of Anger", :level => 378, :equipped => true},
  {:name => "Scintillating Rods", :level => 397, :equipped => true},
  {:name => "Insignia of the Corrupted Mind", :level => 410, :equipped => false, received_on: Date.new(2012, 4, 22) },
  {:name => "Ti'tahk, the Steps of Time", :level => 410, :equipped => false, :received_on => Date.new(2012, 4, 23) }
].each do |i|
    create_and_equip_for_character(i, kakana)
  end

#kazuhiro
[
  {:name => "Colossal Dragonplate Faceguard", :level => 397, :equipped => true},
  {:name => "Guardspike Choker", :level => 397, :equipped => true},
  {:name => "Colossal Dragonplate Shoulderguards", :level => 410, :equipped => true},
  {:name => "Indefatigable Greatcloak", :level => 397, :equipped => true},
  {:name => "Colossal Dragonplate Chestguard", :level => 410, :equipped => true},
  {:name => "Graveheart Bracers", :level => 410, :equipped => true},
  {:name => "Colossal Dragonplate Handguards", :level => 397, :equipped => true},
  {:name => "Forgesmelter Waistplate", :level => 397, :equipped => true},
  {:name => "Colossal Dragonplate Legguards", :level => 410, :equipped => true},
  {:name => "Bladeshatter Treads", :level => 397, :equipped => true},
  {:name => "Signet of the Resolute", :level => 397, :equipped => true},
  {:name => "Adamantine Signet of the Avengers", :level => 391, :equipped => true, :slot => :finger},
  {:name => "Soulshifter Vortex", :level => 410, :equipped => true},
  {:name => "Indomitable Pride", :level => 410, :equipped => true},
  {:name => "Hand of Morchok", :level => 410, :equipped => true},
  {:name => "Blackhorn's Mighty Bulwark", :level => 384, :equipped => true},
  {:name => "Unexpected Backup", :level => 397, :equipped => true},
  
  {:name => "Shoulders of the Corrupted Protector", :level => 410, :equipped => false, :received_on => Date.new(2012, 4, 8) },
  {:name => "Crown of the Corrupted Protector", :level => 397, :equipped => false, :received_on => Date.new(2012, 4, 9) },
  {:name => "Gauntlets of the Corrupted Vanquisher", :level => 410, :equipped => false, :received_on => Date.new(2012, 4, 15) },
  {:name => "Leggings of the Corrupted Protector", :level => 410, :equipped => false, :received_on => Date.new(2012, 4, 15) },
  {:name => "Goriona's Collar", :level => 397, :equipped => false, :receieved_on => Date.new(2012, 4, 16) }
].each do |i|
    create_and_equip_for_character(i, kazuhiro)
  end

  # keljahl
[
  {:name => "Cowl of Dying Light", :level => 397, :equipped => true},
  {:name => "Petrified Fungal Heart", :level => 397, :equipped => true},
  {:name => "Mantle of Dying Light", :level => 410, :equipped => true},
  {:name => "Woundlicker Cover", :level => 397, :equipped => true},
  {:name => "Robes of Dying Light", :level => 410, :equipped => true},
  {:name => "Dreamwraps of the Light", :level => 397, :equipped => true},
  {:name => "Gloves of Liquid Smoke", :level => 403, :equipped => true},
  {:name => "Vestal's Irrepressible Girdle", :level => 397, :equipped => true},
  {:name => "Legwraps of Dying Light", :level => 397, :equipped => true},
  {:name => "Splinterfoot Sandals", :level => 397, :equipped => true},
  {:name => "Soothing Brimstone Circle", :level => 378, :equipped => true},
  {:name => "Band of Reconstruction", :level => 397, :equipped => true},
  {:name => "Seal of the Seven Signs", :level => 384, :equipped => false},
  {:name => "Jas of Defeat", :level => 391, :equipped => true},
  {:name => "Maw of the Dragonlord", :level => 403, :equipped => true},
  {:name => "Goblet of Anger", :level => 391, :wowhead_id => "71448", :equipped => true, :received_on => Date.new(2012, 4, 9)},
  {:name => "Scintillating Rods", :level => 397, :equipped => true},
  
  {:name => "Shoulders of the Corrupted Conquerer", :level => 410, :equipped => false, :received_on => Date.new(2012, 4, 16) },
  {:name => "Chest of the Corrupted Conquerer", :level => 410, :equipped => false, :received_on => Date.new(2012, 4, 16) },
  {:name => "Crown of the Corrupted Conquerer", :level => 397, :equipped => false, :received_on => Date.new(2012, 4, 16) }
].each do |i|
    create_and_equip_for_character(i, keljahl)
  end

# Mischi
[
  {:name => "Time Lord's Hood", :level => 397, :equipped => true},
  {:name => "Opal of the Secret Order", :level => 397, :equipped => true},
  {:name => "Time Lord's Mantle", :level => 397, :equipped => true},
  {:name => "Nanoprecise Cape", :level => 397, :equipped => true},
  {:name => "Time Lord's Robes", :level => 397, :equipped => true},
  {:name => "Bracers of the Banished", :level => 397, :equipped => true},
  {:name => "Time Lord's Gloves", :level => 410, :equipped => true},
  {:name => "Cord of the Slain Champion", :level => 397, :equipped => true},
  {:name => "Lavaquake Legwraps", :level => 397, :equipped => true},
  {:name => "Kavan's Forsaken Treads", :level => 397, :equipped => true},
  {:name => "Seal of the Grand Architect", :level => 397, :equipped => true},
  {:name => "Infinite Loop", :level => 397, :equipped => true},
  {:name => "Will of Unbinding", :level => 403, :equipped => true},
  {:name => "Insignia of the Corrupted Mind", :level => 410, :wowhead_id => "77991", :equipped => true},
  {:name => "Finger of Zon'ozz", :level => 410, :wowhead_id => "78392", :equipped => true, :received_on => Date.new(2012, 4, 8) },
  {:name => "Lightning Rod", :level => 410, :equipped => true},
  
  {:name => "Gauntlets of the Corrupted Vanquisher", :level => 410, :equipped => false, :received_on => Date.new(2012, 4, 8) }
  
].each do |i|
    create_and_equip_for_character(i, mischi)
  end

  # Thundersnow
[
  {:name => "Time Lord's Hood", :level => 397, :equipped => true},
  {:name => "Flowform Choker", :level => 378, :equipped => true},
  {:name => "Mosswrought Shoulderguards", :level => 410, :equipped => true},
  {:name => "Nanoprecise Cape", :level => 397, :equipped => true},
  {:name => "Time Lord's Robes", :level => 397, :equipped => true},
  {:name => "Bracers of Unconquered Power", :level => 397, :equipped => true},
  {:name => "Time Lord's Gloves", :level => 410, :equipped => true},
  {:name => "Tentacular Belt", :level => 397, :equipped => true},
  {:name => "Time Lord's Leggings", :level => 397, :equipped => true},
  {:name => "Janglespur Jackboots", :level => 397, :wowhead_id => "78449", :equipped => true},
  {:name => "Ring of the Riven", :level => 397, :equipped => true},
  {:name => "Seal of the Grand Architect", :level => 397, :equipped => true},
  {:name => "Insignia of the Corrupted Mind", :level => 410, :wowhead_id => "77991", :equipped => true, :received_on => Date.new(2012, 4, 15) },
  {:name => "Will of Unbinding", :level => 403, :equipped => true},
  {:name => "Finger of Zon'ozz", :level => 397, :equipped => true},
  {:name => "Dragonwrath, Tarecgosa's Rest", :level => 397, :equipped => true}
].each do |i|
    create_and_equip_for_character(i, thundersnow)
  end

# Urielle
[
  {:name => "Blackfang Battleweave Helmet", :level => 397, :equipped => true},
  {:name => "Cameo of Terrible Memories", :level => 397, :equipped => true},
  {:name => "Underweller's Spaulders", :level => 410, :equipped => true},
  {:name => "Batwing Cloak", :level => 397, :equipped => true},
  {:name => "Blackfang Battleweave Tunic", :level => 410, :equipped => true},
  {:name => "Shadow Wing Armbands", :level => 397, :wowhead_id => "78446", :equipped => true},
  {:name => "Blackfang Battleweave Gloves", :level => 410, :equipped => true},
  {:name => "Belt of Flayed Skin", :level => 410, :wowhead_id => "78388", :equipped => true},
  {:name => "Blackfang Battleweave Legguards", :level => 410, :equipped => true},
  {:name => "Interrogator's Bloody Footpads", :level => 410, :equipped => true},
  {:name => "Seal of Primordial Shadow", :level => 397, :equipped => true},
  {:name => "Emergency Descent Loop", :level => 397, :equipped => true},
  {:name => "Starcatcher Compass", :level => 397, :equipped => true},
  {:name => "Wrath of Unchaining", :level => 403, :wowhead_id => "77994", :equipped => true},
  {:name => "Golad, Twilight of Aspects", :level => 416, :equipped => true},
  {:name => "Tirosh, Nightmare of Ages", :level => 416, :equipped => true},
  {:name => "Razor Saronite Chip", :level => 410, :equipped => true},

  {:name => "Chest of the Corrupted Vanquisher", :level => 410, :equipped => false, :received_on => Date.new(2012, 4, 8)}
].each do |i|
    create_and_equip_for_character(i, urielle)
  end

# Valarian
[
  {:name => "Helmet of Radiant Glory", :level => 397, :equipped => true},
  {:name => "Necklace of Black Dragon's Teeth", :level => 397, :equipped => true},
  {:name => "Backbreaker Spaulders", :level => 403, :equipped => true},
  {:name => "Dreamcrusher Drape", :level => 397, :equipped => true},
  {:name => "Battleplate of Radiant Glory", :level => 410, :equipped => true},
  {:name => "Rockhide Bracers", :level => 410, :equipped => true},
  {:name => "Gauntlets of Radiant Glory", :level => 397, :equipped => true},
  {:name => "Demonbone Waistguard", :level => 397, :equipped => true},
  {:name => "Legplates of Radiant Glory", :level => 410, :equipped => true},
  {:name => "Treads of Crushed Flesh", :level => 397, :equipped => true},
  {:name => "Ring of Torn Flesh", :level => 397, :equipped => true},
  {:name => "Curled Twilight Claw", :level => 397, :equipped => false},
  {:name => "Bone-Link Fetish", :level => 397, :equipped => true},
  {:name => "Eye of Unmaking", :level => 403, :equipped => true},
  {:name => "Gutripper Shard", :level => 397, :equipped => true},
  {:name => "Gurthalak, Voice of the Deeps", :level => 403, :equipped => true},

  {name: "Dragonfracture Belt", :level => 410, :equipped => false, :received_on => Date.new(2012, 4, 16)},
  {name: "Gauntlets of the Golden Thorn", :level => 397, :equipped => false, :received_on => Date.new(2012, 4, 23)},
].each do |i|
    create_and_equip_for_character(i, valarian)
  end

# Virtual
[
  {name: "Faceguard of Radiant Glory", :level => 397, :equipped => true},
  {name: "Guardspike Choker", :level => 397, :equipped => true},
  {name: "Brackenshell Shoulderplates", :level => 410, :wowhead_id => "78367", :equipped => true, :received_on => Date.new(2012, 4, 15)},
  {name: "Indefatigable Greatcloak", :level => 397, :equipped => true},
  {name: "Chestguard of Radiant Glory", :level => 397, :equipped => true},
  {name: "Titanguard Wristplates", :level => 397, :equipped => true},
  {name: "Handguards of Radiant Glory", :level => 410, :equipped => true},
  {name: "Forgesmelter Waistplate", :level => 397, :equipped => true},
  {name: "Legguards of Radiant Glory", :level => 410, :equipped => true},
  {name: "Bladeshatter Treads", :level => 397, :equipped => true},
  {name: "Signet of the Resolute", :level => 397, :equipped => true},
  {name: "Adamantine Signet of the Avengers", :level => 391, :equipped => true, :slot => :finger},
  {name: "Indomitable Pride", :level => 397, :equipped => true},
  {name: "Soulshifter Vortex", :level => 410, :equipped => true},
  {name: "Hand of Morchok", :level => 410, :equipped => true},
  {name: "Blackhorn's Mighty Bulwark", :level => 397, :equipped => true},
  {name: "Stoutheart Talisman", :level => 397, :equipped => true},

  {name: "Leggings of the Corrupted Conquerer", :level => 410, :equipped => false, :received_on => Date.new(2012, 4, 8)},
  {name: "Souldrinker", :level => 397, :equipped => false, :received_on => Date.new(2012, 4, 8)},
  {name: "Crown of the Corrupted Conquerer", :level => 397, :equipped => false, :received_on => Date.new(2012, 4, 23)},

].each do |i|
    create_and_equip_for_character(i, virtual)
  end

# Felania
[
  {name: "Necrotic Boneplate Faceguard", level: 397, equipped: true },
  {name: "Guardspike Choker", level: 397, equipped: true },
  {name: "Necrotic Boneplate Shoulderguards", level: 397, equipped: true },
  {name: "Indefatigable Greatcloak", level: 397, equipped: true },
  {name: "Necrotic Boneplate Chestguard", level: 397, equipped: true },
  {name: "Titanguard Wristplates", level: 397, equipped: true },
  {name: "Necrotic Boneplate Handguards", level: 397, equipped: false },
  {name: "Goriona's Collar", level: 397, equipped: true },
  {name: "Foundations of Courage", level: 397, equipped: true },
  {name: "Bladeshatter Treads", level: 397, equipped: true },
  {name: "Signet of the Resolute", level: 397, equipped: true },
  {name: "Deflecting Brimstone Band", level: 378, equipped: true },
  {name: "Fire of the Deep", level: 397, equipped: true },
  {name: "Resolve of Undying", level: 403, equipped: true },
  {name: "Experimental Specimen Slicer", level: 397, equipped: true },
  {name: "Deathclutch Figurine", level: 378, equipped: true },
].each do |i|
    i[:main] = true
    create_and_equip_for_character(i, felania)
  end

[
  {name: "Necrotic Boneplate Helmet", level: 397, equipped: true},
  {name: "Necklace of Black Dragon's Teeth", level: 397, equipped: true},
  {name: "Backbreaker Spaulders", level: 390, equipped: true},
  {name: "Dreamcrusher Drape", level: 397, equipped: true},
  {name: "Necrotic Boneplate Breastplate", level: 397, equipped: true},
  {name: "Rockhide Bracers", level: 397, equipped: true},
  {name: "Necrotic Boneplate Gauntlets", level: 397, equipped: true},
  {name: "Girdle of the Queen's Champion", level: 378, equipped: true},
  {name: "Necrotic Boneplate Greaves", level: 384, equipped: true},
  {name: "Kneebreaker Boots", level: 397, equipped: true},
  {name: "Ring of Torn Flesh", level: 397, equipped: true},
  {name: "Breathstealer Band", level: 384, equipped: true},
  {name: "Creche of the Final Dragon", level: 397, equipped: true},
  {name: "License to Slay", level: 359, equipped: true},
  {name: "Gurthalak, Voice of the Deeps", level: 403, equipped: true},
  {name: "Gutripper Shard", level: 397, equipped: true},
  
  {name: "Hand of Morchok", level: 410, equipped: false, received_on: Date.new(2012, 4, 22) },
  {name: "Gurthalak", level: 397, equipped: true, received_on: Date.new(2012, 4, 23) },
].each do |i|
    i[:main] = false
    create_and_equip_for_character(i, felania)
  end

# i = Item.create({name: "Petrified Fungal Heart", :level => 410})
# l = Loot.create({character: kakana, item: i, :equipped => true})

# i = Item.create({name: "Robe of Glowing Stone", :level => 410})
# l = Loot.create({character: kakana, item: i,  received_on: Date.new(2012, 4, 8), equipped: true})
# 
# # i = Item.create({name: "Janglespur Jackboots", level: 410)
# l = Loot.create({character: nil, item: i, received_on: Date.new(2012, 4, 9)})
# 
# # i = Item.create({name: "Belt of Flayed Skin", level: 410})
# l = Loot.create({character: nil, item: i, received_on: Date.new(2012, 4, 12)})
# l = Loot.create({character: nil, item: i, received_on: Date.new(2012, 4, 12)})
# 
# # i = Item.create({name: "Shadow Wing Armbands", level: 410})
# l = Loot.create({character: nil, item: i, received_on: Date.new(2012, 4, 23)})
# 
# # i = Item.create({name: "Mindstrainer Treads", level: 410})
# l = Loot.create({character: ganvil, item: i, received_on: Date.new(2012, 4, 8)})
# 
# # i = Item.create({name: "Treads of Dormant Dreams", level: 410})
# l = Loot.create({character: clete, item: i, received_on: Date.new(2012, 4, 8), equipped: true})
# 
# i = Item.create({name: "Belt of Shattered Elementium", level: 410, :wowhead_id => "78463"})
# l = Loot.create({character: nil, item: i, received_on: Date.new(2012, 4, 9)})
# 
# # i = Item.create({name: "Bracers of Looming Darkness", level: 410})
# l = Loot.create({character: ganvil, item: Item.find_by_name("Bracers of Looming Darkness"), received_on: Date.new(2012, 4, 8)})
# 
# i = Item.create({name: "Girdle of Shattered Stone", level: 410, :wowhead_id => "78370"})
# l = Loot.create({character: nil, item: i, received_on: Date.new(2012, 4, 15)})
# 
# # i = Item.create({name: "Finger of Zon'ozz", level: 410})
# l = Loot.create({character: mischi, item: i, received_on: Date.new(2012, 4, 8)})
# 
# i = Item.create({name: "Wrath of Unchaining", level: 410})
# l = Loot.create({character: nil, item: i, received_on: Date.new(2012, 4, 9)})
# l = Loot.create({character: nil, item: i, received_on: Date.new(2012, 4, 23)})
# 
# # i = Item.create({name: "Goblet of Anger", level: 391})
# l = Loot.create({character: keljahl, item: i, received_on: Date.new(2012, 4, 9), equipped: true})
# 
# # i = Item.create({name: "Insignia of the Corrupted Mind", level: 410})
# l = Loot.create({character: kakana, item: i, received_on: Date.new(2012, 4, 22)})
# # l = Loot.create({character: thundersnow, item: i, received_on: Date.new(2012, 4, 15)})
# # l = Loot.create({character: mischi, item: i})
# 
# # i = Item.create({name: "Brackenshell Shoulderplates", level: 410})
# l = Loot.create({character: virtual, item: i, received_on: Date.new(2012, 4, 15), equipped: true})
# 
# i = Item.create({name: "Dragonfracture Belt", level: 410, :wowhead_id => "78436"})
# l = Loot.create({character: valarian, item: i, received_on: Date.new(2012, 4, 16)})
# 
# i = Item.create({name: "Gauntlets of the Golden Thorn", level: 397, :wowhead_id => "77235"})
# l = Loot.create({character: valarian, item: i, received_on: Date.new(2012, 4, 23)})
# 
# i = Item.create({name: "Leggings of the Corrupted Conquerer", level: 410, :wowhead_id => "78856"})
# l = Loot.create({character: virtual, item: i, received_on: Date.new(2012, 4, 8), equipped: true})
# 
# i = Item.create({name: "Gauntlets of the Corrupted Vanquisher", level: 410, :wowhead_id => "78855"})
# l = Loot.create({character: kazuhiro, item: i, received_on: Date.new(2012, 4, 15)})
# l = Loot.create({character: mischi, item: i, received_on: Date.new(2012, 4, 8)})
# 
# i = Item.create({name: "Shoulders of the Corrupted Protector", level: 410, :wowhead_id => "78860"})
# l = Loot.create({character: kazuhiro, item: i, received_on: Date.new(2012, 4, 8)})
# 
# i = Item.create({name: "Crown of the Corrupted Protector", level: 410, :wowhead_id => "78851"})
# l = Loot.create({character: kazuhiro, item: i, received_on: Date.new(2012, 4, 9), equipped: true})
# 
# i = Item.create({name: "Leggings of the Corrupted Protector", level: 410, :wowhead_id => "78857"})
# l = Loot.create({character: ganvil, item: i, received_on: Date.new(2012, 4, 22)})
# l = Loot.create({character: kazuhiro, item: i, received_on: Date.new(2012, 4, 15)})
# 
# i = Item.create({name: "Chest of the Corrupted Vanquisher", level: 410, :wowhead_id => "78849"})
# l = Loot.create({character: urielle, item: i, received_on: Date.new(2012, 4, 8)})
# 
# i = Item.create({name: "Chest of the Corrupted Conquerer", level: 410, :wowhead_id => "78847"})
# l = Loot.create({character: keljahl, item: i, received_on: Date.new(2012, 4, 23)})
# 
# i = Item.create({name: "Crown of the Corrupted Conquerer", level: 397, :wowhead_id => "78850"})
# l = Loot.create({character: virtual, item: i, received_on: Date.new(2012, 4, 23)})
# l = Loot.create({character: keljahl, item: i, received_on: Date.new(2012, 4, 16)})
# 
# i = Item.create({name: "Gauntlets of the Corrupted Protector", level: 410, :wowhead_id => "78854"})
# l = Loot.create({character: ganvil, item: i, received_on: Date.new(2012, 4, 22)})
# 
# i = Item.create({name: "Souldrinker", level: 403, :wowhead_id => "77193"})
# l = Loot.create({character: virtual, item: i, received_on: Date.new(2012, 4, 9)})
# 
# i = Item.create({name: "No'Kaled, the Elements of Death", level: 403, :wowhead_id => "77188"})
# l = Loot.create({character: nil, item: i, received_on: Date.new(2012, 4, 9)})
# 
# i = Item.create({name: "Hand of Morchok", level: 410, :wowhead_id => "78371"})
# l = Loot.create({character: nil, item: i, received_on: Date.new(2012, 4, 8)})
# l = Loot.create({character: felania, item: i, received_on: Date.new(2012, 4, 23)})
# l = Loot.create({character: kazuhiro, item: i})
# l = Loot.create({character: virtual, item: i})
# 
# i = Item.create({name: "Ti'tahk, the Steps of Time", level: 403, :wowhead_id => "77190"})
# l = Loot.create({character: kakana, item: i, received_on: Date.new(2012, 4, 23)})
# 
# i = Item.create({name: "Gurthalak, Voice of the Deeps", level: 403, :wowhead_id => "77191"})
# l = Loot.create({character: felania, item: i, received_on: Date.new(2012, 4, 23)})
# 
# i = Item.create({name: "Goriana's Collar", :level => 397, :wowhead_id => "77239"})
# l = Loot.create({character: kazuhiro, item: i, received_on: Date.new(2012, 4, 16)})