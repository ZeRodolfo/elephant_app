class AddForeignKeyToParecers < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :parecers, :patients
  end
end
