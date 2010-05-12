class CreatePerfilContratantes < ActiveRecord::Migration
  def self.up
    create_table :perfil_contratantes do |t|
      t.references :tipo_perfil_contratante
      t.string :nombre
      t.string :cif
      t.text :wikipedia_url
      t.references :partido_politico
      t.text :foto
      t.text :escudo
      t.integer :habitantes
      t.text :alcalde_voota_link
      t.references :provincia
      t.references :comunidad_autonoma
      t.text :direccion
      t.text :poblacion
      t.string :cp
      t.string :tlf
      t.string :fax
      t.text :web
      t.string :email
      t.float :presupuesto_total
      t.text :presupuesto_url

      t.timestamps
    end
    
    add_index :perfil_contratantes, :cif
    add_index :perfil_contratantes, :tipo_perfil_contratante_id
    add_index :perfil_contratantes, :partido_politico_id
    add_index :perfil_contratantes, :provincia_id
    add_index :perfil_contratantes, :comunidad_autonoma_id
  end

  def self.down
    drop_table :perfil_contratantes
  end
end
