class CreateLicitacions < ActiveRecord::Migration
  def self.up
    create_table :licitacions do |t|
      t.references :organo_convocante
      t.string :expediente
      t.references :tipo_procedimiento
      t.references :tipo_licitacion
      t.float :importe
      t.datetime :fecha_publicacion
      t.datetime :fecha_adjudicacion
      t.string :titulo
      t.text :descripcion
      t.string :codigo_cpv_ppal
      t.references :estado
      t.text :url_licitacion
      t.integer :votes_up
      t.integer :votes_down
      t.integer :num_comentarios
      t.text :ref_publicacion
      t.references :fuente_datos
      t.references :programa_financion
      t.datetime :fecha_ultima_actualizacion

      t.timestamps
    end
    
    add_index :licitacions, :expediente
    add_index :licitacions, :importe
    add_index :licitacions, :titulo
    add_index :licitacions, :codigo_cpv_ppal
    add_index :licitacions, :tipo_procedimiento_id
    add_index :licitacions, :organo_convocante_id
    add_index :licitacions, :tipo_licitacion_id
    add_index :licitacions, :estado_id
    add_index :licitacions, :fuente_datos_id
    add_index :licitacions, :programa_financion_id
  end

  def self.down
    drop_table :licitacions
  end
end
