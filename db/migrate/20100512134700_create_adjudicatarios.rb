class CreateAdjudicatarios < ActiveRecord::Migration
  def self.up
    create_table :adjudicatarios do |t|
      t.string :cif
      t.string :nombre
      t.string :direccion
      t.string :poblacion
      t.string :cp
      t.string :tlf
      t.string :fax
      t.string :email
      t.string :web      

      t.timestamps
    end
    add_column :adjudicatarios, :the_geom, :point,:srid => 4326, :with_z => false
    
    add_index :adjudicatarios, :cif
  end

  def self.down
    drop_table :adjudicatarios
  end
end
