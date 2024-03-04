require 'csv'

Move.delete_all
Pokemon.delete_all
Type.delete_all
PokemonMove.delete_all
PokemonType.delete_all

pokemon_csv = Rails.root.join("db/pokemon.csv")
pokemon_csv_data = File.read(pokemon_csv)
pokemons = CSV.parse(pokemon_csv_data, headers: true, encoding: "utf-8")

pokemond_description_csv = Rails.root.join("db/pokemon_species_flavor_text.csv")
pokemond_description_csv_data = File.read(pokemond_description_csv)
pokemon_descriptions = CSV.parse(pokemond_description_csv_data, headers: true, encoding: "utf-8")

stat_csv = Rails.root.join("db/stats.csv")
stat_csv_data = File.read(stat_csv)
stats = CSV.parse(stat_csv_data, headers: true, encoding: "utf-8")

pokemond_stats_csv = Rails.root.join("db/pokemon_stats.csv")
pokemond_stats_csv_data = File.read(pokemond_stats_csv)
pokemond_stats = CSV.parse(pokemond_stats_csv_data, headers: true, encoding: "utf-8")

pokemons.first(151).each do |pokemon|

  new_pokemon = Pokemon.new

  pokemon_description = pokemon_descriptions.find do |description|
    description['species_id'].to_i == pokemon['species_id'].to_i &&
    description['version_id'].to_i == 7 &&
    description['language_id'].to_i == 9
  end

  pokemon_stats = pokemond_stats.select do |pokemon_stat|
    pokemon_stat['pokemon_id'].to_i == pokemon['id'].to_i
  end

  new_pokemon.name = pokemon['identifier']
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

