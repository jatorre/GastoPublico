class ChangeComentarioColumn < ActiveRecord::Migration
  def self.up
    rename_column :comentarios, :usario_id, :usuario_id 
  end

  def self.down
    rename_column :comentarios, :usuario_id, :usario_id
  end
end
