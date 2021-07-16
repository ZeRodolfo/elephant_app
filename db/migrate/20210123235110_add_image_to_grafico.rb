class AddImageToGrafico < ActiveRecord::Migration[5.2]
  def change
    add_column :graficos, :image, :string
  end
end
