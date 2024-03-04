class AddBackDescriptionToMove < ActiveRecord::Migration[7.1]
  def change
    add_column :moves, :description, :string
  end
end
