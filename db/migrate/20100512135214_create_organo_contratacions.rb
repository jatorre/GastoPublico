class CreateOrganoContratacions < ActiveRecord::Migration
  def self.up
    create_table :organo_contratacions do |t|
      t.references :administracion
      t.text :nombre
      t.string :direccion
      t.string :poblacion
      t.string :cp
      t.string :tlf
      t.string :fax
      t.string :email
      t.string :web      

      t.timestamps
    end
    
    add_index :organo_contratacions, :administracion_id
  end

  def self.down
    drop_table :organo_contratacions
  end
end
