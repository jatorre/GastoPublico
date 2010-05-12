class CreateComunidadAutonomas < ActiveRecord::Migration
  def self.up
    create_table :comunidad_autonomas do |t|
      t.string :nombre

      t.timestamps
    end
  end

  def self.down
    drop_table :comunidad_autonomas
  end
end
