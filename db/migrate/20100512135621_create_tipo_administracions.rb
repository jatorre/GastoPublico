class CreateTipoAdministracions < ActiveRecord::Migration
  def self.up
    create_table :tipo_administracions do |t|
      t.string :nombre

      t.timestamps
    end
  end

  def self.down
    drop_table :tipo_administracions
  end
end
