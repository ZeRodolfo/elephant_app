class AddComplementAndNeighborhoodToAddress < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :complement, :string
    add_column :addresses, :neighborhood, :string
  end
end
