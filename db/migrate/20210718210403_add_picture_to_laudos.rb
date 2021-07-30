class AddPictureToLaudos < ActiveRecord::Migration[5.2]
  def change
    add_column :laudos, :picture, :string
  end
end
