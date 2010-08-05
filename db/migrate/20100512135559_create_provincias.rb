class CreateProvincias < ActiveRecord::Migration
  def self.up
    create_table :provincias do |t|
      t.string :nombre
      t.references :comunidad_autonoma

      t.timestamps
    end
    
    add_index :provincias, :comunidad_autonoma_id
    
  end

  def self.down
    drop_table :provincias
  end
end
