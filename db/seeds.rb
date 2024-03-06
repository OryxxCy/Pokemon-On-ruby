require 'csv'

PokemonMove.delete_all
PokemonType.delete_all
Move.delete_all
Pokemon.delete_all
Type.delete_all

pokemon_csv = Rails.root.join("db/pokemon.csv")
pokemon_csv_data = File.read(pokemon_csv)
pokemons = CSV.parse(pokemon_csv_data, headers: true, encoding: "utf-8")

pokemond_description_csv = Rails.root.join("db/pokemon_species_flavor_text.csv")
pokemond_description_csv_data = File.read(pokemond_description_csv)
pokemon_descriptions = CSV.parse(pokemond_description_csv_data, headers: true, encoding: "utf-8")

pokemond_stats_csv = Rails.root.join("db/pokemon_stats.csv")
pokemond_stats_csv_data = File.read(pokemond_stats_csv)
pokemond_stats = CSV.parse(pokemond_stats_csv_data, headers: true, encoding: "utf-8")

pokemons.first(151).each do |pokemon|

  new_pokemon = Pokemon.new

  pokemon_description = pokemon_descriptions.find do |description|
    description['species_id'].to_i == pokemon['species_id'].to_i &&
    description['version_id'].to_i == 9 &&
    description['language_id'].to_i == 9
  end

  pokemon_stats = pokemond_stats.select do |pokemon_stat|
    pokemon_stat['pokemon_id'].to_i == pokemon['id'].to_i
  end

  new_pokemon.id = pokemon['species_id']
  new_pokemon.name = pokemon['identifier'].capitalize
  new_pokemon.description = pokemon_description['flavor_text']

  pokemon_stats.each do |stat|
    stat_name = case stat['stat_id'].to_i
                  when 1 then new_pokemon.hp = stat['base_stat']
                  when 2 then new_pokemon.attack = stat['base_stat']
                  when 3 then new_pokemon.defense = stat['base_stat']
                  when 4 then new_pokemon.special_attack = stat['base_stat']
                  when 5 then new_pokemon.special_defense = stat['base_stat']
                  when 6 then new_pokemon.speed = stat['base_stat']
                end
  end

  unless new_pokemon.save
    puts "Invalid Pokemon"
  end
end

type_csv = Rails.root.join("db/types.csv")
type_csv_data = File.read(type_csv)
types = CSV.parse(type_csv_data, headers: true, encoding: "utf-8")

types.first(18).each do |type|
  new_type = Type.create(id: type['id'], name: type['identifier'].capitalize)

  puts "Invalid Type" unless new_type&.valid?
end

move_csv = Rails.root.join("db/moves.csv")
move_csv_data = File.read(move_csv)
moves = CSV.parse(move_csv_data, headers: true, encoding: "utf-8")

move_description_csv = Rails.root.join("db/move_flavor_text.csv")
move_description_csv_data = File.read(move_description_csv)
move_descriptions = CSV.parse(move_description_csv_data, headers: true, encoding: "utf-8")

moves.first(165).each do |move|
  type = Type.find_by(id: move['type_id'])

  if type
    new_move = type.moves.new
    new_move.id = move['id']
    new_move.name = move['identifier'].capitalize

    move_description = move_descriptions.find do |description|
      description['move_id'].to_i == move['id'].to_i &&
      description['version_group_id'].to_i == 7 &&
      description['language_id'].to_i == 9
    end

    new_move.description = move_description['flavor_text']
    new_move.power = move['power'].to_i
    new_move.accuracy = move['accuracy'].to_i
    new_move.pp = move['pp'].to_i
    new_move.move_category = case move['damage_class_id'].to_i
                                when 1 then "Status"
                                when 2 then "Physical"
                                when 3 then "Special"
                              end
  end

  unless new_move.save
    puts "Invalid Move #{move['id']}"
  end
end

pokemon_type_csv = Rails.root.join("db/pokemon_types.csv")
pokemon_type_csv_data = File.read(pokemon_type_csv)
pokemon_types = CSV.parse(pokemon_type_csv_data, headers: true, encoding: "utf-8")

pokemon_types.each do |pokemon_type|
  pokemon = Pokemon.find_by(id: pokemon_type['pokemon_id'].to_i)
  type = Type.find_by(id: pokemon_type['type_id'].to_i)

  if pokemon && type
    new_pokemon_type = PokemonType.create(
      pokemon_id: pokemon.id,
      type_id: type.id
    )
  end
end

pokemon_move_csv = Rails.root.join("db/pokemon_moves.csv")
pokemon_move_csv_data = File.read(pokemon_move_csv)
pokemon_moves = CSV.parse(pokemon_move_csv_data, headers: true, encoding: "utf-8")

pokemon_moves.each do |pokemon_move|
  pokemon = Pokemon.find_by(id: pokemon_move['pokemon_id'].to_i)
  move = Move.find_by(id: pokemon_move['move_id'].to_i)

  if pokemon && move && pokemon_move['version_group_id'].to_i == 1
    new_pokemon_move = PokemonMove.create(
      pokemon_id: pokemon.id,
      move_id: move.id
    )
  end

  if pokemon_move['pokemon_id'].to_i == 152
    break
  end
end