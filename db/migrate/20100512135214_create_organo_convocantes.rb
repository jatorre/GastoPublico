class CreateOrganoConvocantes < ActiveRecord::Migration
  def self.up
    create_table :organo_convocantes do |t|
      t.references :perfil_contratante
      t.text :nombre
      t.string :direccion
      t.string :poblacion
      t.string :cp
      t.string :tlf
      t.string :fax
      t.string :email
      t.text :web

      t.timestamps
    end
    
    add_index :organo_convocantes, :perfil_contratante_id
  end

  def self.down
    drop_table :organo_convocantes
  end
end
