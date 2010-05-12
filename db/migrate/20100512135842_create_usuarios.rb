class CreateUsuarios < ActiveRecord::Migration
  def self.up
    create_table :usuarios do |t|
      t.string :token
      t.string :nombre
      t.string :email
      t.text :web

      t.timestamps
    end
    
    add_index :usuarios, :token
    add_index :usuarios, :email
  end

  def self.down
    drop_table :usuarios
  end
end
