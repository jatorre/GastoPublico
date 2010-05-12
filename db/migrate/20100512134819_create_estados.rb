class CreateEstados < ActiveRecord::Migration
  def self.up
    create_table :estados do |t|
      t.string :nombre

      t.timestamps
    end
  end

  def self.down
    drop_table :estados
  end
end
