class CreatePartidoPoliticos < ActiveRecord::Migration
  def self.up
    create_table :partido_politicos do |t|
      t.string :nombre
      t.string :siglas
      t.text :web

      t.timestamps
    end
  end

  def self.down
    drop_table :partido_politicos
  end
end
