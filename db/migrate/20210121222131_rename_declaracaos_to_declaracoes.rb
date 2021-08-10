class RenameDeclaracaosToDeclaracoes < ActiveRecord::Migration[5.2]
  def change
    rename_table :declaracaos, :declaracoes
  end
end
