class ChangeAttributesOfPatient < ActiveRecord::Migration[5.2]
  def up
    remove_index :form_id, name: "index_patients_on_form_id"

    remove_column :patients, :form_id
    remove_column :patients, :company
    remove_column :patients, :marital_status
    remove_column :patients, :schooling
    remove_column :patients, :office

    add_column :patients, :birth_date, :date
    add_column :patients, :gender, :integer
    add_column :patients, :phone, :string
    add_column :patients, :relative_phone, :string
    add_column :patients, :profession, :string
  end

  def down
    remove_index :form_id, name: "index_patients_on_form_id"

    remove_column :patients, :form_id
    remove_column :patients, :company
    remove_column :patients, :marital_status
    remove_column :patients, :schooling
    remove_column :patients, :office

    add_column :patients, :birth_date, :date
    add_column :patients, :gender, :integer
    add_column :patients, :phone, :string
    add_column :patients, :relative_phone, :string
    add_column :patients, :profession, :string
  end
end
