class CreateFuenteDatos < ActiveRecord::Migration
  def self.up
    create_table :fuente_datos do |t|
      t.string :nombre
      t.datetime :ultima_importacion
      t.text :web

      t.timestamps
    end
  end

  def self.down
    drop_table :fuente_datos
  end
end
