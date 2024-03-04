class DropTypeStrength < ActiveRecord::Migration[7.1]
  def change
    drop_table :type_strengths
  end
end
