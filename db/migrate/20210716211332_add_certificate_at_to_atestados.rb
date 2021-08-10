class AddCertificateAtToAtestados < ActiveRecord::Migration[5.2]
  def change
    add_column :atestados, :certificate_at, :date
  end
end
