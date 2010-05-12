class CreateAdjudicatarios < ActiveRecord::Migration
  def self.up
    create_table :adjudicatarios do |t|
      t.string :cif
      t.string :nombre
      t.text :direction
      t.string :poblacion
      t.string :cp
      t.string :tlf
      t.string :fax
      t.string :email
      t.text :web

      t.timestamps
    end
    
    add_index :adjudicatarios, :cif
  end

  def self.down
    drop_table :adjudicatarios
  end
end
