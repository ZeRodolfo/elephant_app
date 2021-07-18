class AddDefaultOfficeVisitValueToPatients < ActiveRecord::Migration[5.2]
  def change
    add_column :patients, :default_office_visit_value, :decimal
  end
end
