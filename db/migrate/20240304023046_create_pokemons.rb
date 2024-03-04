class CreatePokemons < ActiveRecord::Migration[7.1]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.string :sprite
      t.string :description
      t.integer :hp
      t.integer :attack
      t.integer :special_attack
      t.integer :defense
      t.integer :special_defense
      t.integer :speed
      t.references :ability, null: false, foreign_key: true

      t.timestamps
    end
  end
end
