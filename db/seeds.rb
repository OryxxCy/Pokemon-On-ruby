require 'csv'

Ability.delete_all
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

pokemons.first(151).each do |pokemon|

  pokemon_description = pokemon_descriptions.find do |description|
    description['species_id'].to_i == pokemon['species_id'].to_i &&
    description['version_id'].to_i == 7 &&
    description['language_id'].to_i == 9
  end

  if pokemon_description
    puts "ID: #{pokemon['species_id']}, Name: #{pokemon['identifier']} \nDescription: #{pokemon_description['flavor_text']}"
  else
    puts "ID: #{pokemon['id']}, Name: #{pokemon['identifier']} \nNo description found."
  end
end