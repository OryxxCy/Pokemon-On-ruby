class AddNewColumnToMoves < ActiveRecord::Migration[7.1]
  def change
    add_column :moves, :pp, :integer
  end
end
