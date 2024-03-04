class CreateTypeStrengths < ActiveRecord::Migration[7.1]
  def change
    create_table :type_strengths do |t|
      t.references :type, null: false, foreign_key: true
      t.references :strong_agains_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
