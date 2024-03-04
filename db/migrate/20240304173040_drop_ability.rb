class DropAbility < ActiveRecord::Migration[7.1]
  def change
    drop_table :abilities
  end
end
