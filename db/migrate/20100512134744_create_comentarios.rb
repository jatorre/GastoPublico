class CreateComentarios < ActiveRecord::Migration
  def self.up
    create_table :comentarios do |t|
      t.references :usuario
      t.references :licitacion
      t.references :tipo_licitacion
      t.text :comentario
      t.boolean :is_vote

      t.timestamps
    end
    
    add_index :comentarios, :usuario_id
    add_index :comentarios, :licitacion_id
    add_index :comentarios, :tipo_licitacion_id
  end

  def self.down
    drop_table :comentarios
  end
end
