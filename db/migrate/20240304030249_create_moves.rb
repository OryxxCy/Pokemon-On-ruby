class CreateMoves < ActiveRecord::Migration[7.1]
  def change
    create_table :moves do |t|
      t.string :name
      t.string :description
      t.integer :power
      t.integer :accuracy
      t.string :move_category
      t.references :type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
