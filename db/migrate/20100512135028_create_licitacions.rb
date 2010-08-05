class CreateLicitacions < ActiveRecord::Migration
  def self.up
    create_table :licitacions do |t|
      t.references :organo_contratacion
      t.string :expediente
      t.references :tipo_procedimiento
      t.references :tipo_licitacion
      t.float :importe_estimado
      t.datetime :fecha_publicacion
      t.datetime :fecha_adjudicacion
      t.string :titulo
      t.text :descripcion
      t.string :codigo_cpv_ppal
      t.text :url_licitacion
      t.integer :votes_up, :default => 0
      t.integer :votes_down, :default => 0
      t.integer :num_comentarios, :default => 0
      t.text :ref_publicacion
      t.text :mesa_contratacion
      t.references :fuente_datos
      t.references :programa_financion

      t.timestamps
    end
    add_column :licitacions, :the_geom, :point, :srid => 4326, :with_z => false
    
    add_index :licitacions, :expediente
    add_index :licitacions, :importe_estimado
    add_index :licitacions, :titulo
    add_index :licitacions, :codigo_cpv_ppal
    add_index :licitacions, :tipo_procedimiento_id
    add_index :licitacions, :organo_contratacion_id
    add_index :licitacions, :tipo_licitacion_id
    add_index :licitacions, :fuente_datos_id
    add_index :licitacions, :programa_financion_id
  end

  def self.down
    drop_table :licitacions
  end
end
