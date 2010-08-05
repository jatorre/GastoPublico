class CreateAdministracions < ActiveRecord::Migration
  def self.up
    create_table :administracions do |t|
      t.string :nombre
      t.string :cif
      t.text :wikipedia_url
      t.text :foto
      t.text :escudo
      t.integer :habitantes
      t.text :alcalde_voota_link
      t.float :presupuesto_total
      t.text :presupuesto_url
      t.integer :parent_id
      t.integer :lft
      t.integer :rgt    

      t.string :direccion
      t.string :poblacion
      t.string :cp
      t.string :tlf
      t.string :fax
      t.string :email
      t.string :web      

      t.references :tipo_administracion 
      t.references :provincia
      t.references :comunidad_autonoma
      t.references :partido_politico      
      
      t.timestamps
    end
    add_column :administracions, :the_geom, :point,:srid => 4326, :with_z => false
    
    add_index :administracions, :cif
    add_index :administracions, :tipo_administracion_id
    add_index :administracions, :partido_politico_id
    add_index :administracions, :provincia_id
    add_index :administracions, :comunidad_autonoma_id
  end

  def self.down
    drop_table :administracions
  end
end
