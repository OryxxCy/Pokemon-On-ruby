require 'poke-api-v2'

(1..200).each do |pokemon_id|
  pokemon = PokeApi.get(pokemon: pokemon_id)

  puts "Name: #{pokemon.name}"

end