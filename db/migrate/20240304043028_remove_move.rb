class RemoveMove < ActiveRecord::Migration[7.1]
  def change
    remove_column :moves, :description, :string
  end
end
