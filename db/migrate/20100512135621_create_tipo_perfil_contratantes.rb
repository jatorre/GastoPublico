class CreateTipoPerfilContratantes < ActiveRecord::Migration
  def self.up
    create_table :tipo_perfil_contratantes do |t|
      t.string :nombre

      t.timestamps
    end
  end

  def self.down
    drop_table :tipo_perfil_contratantes
  end
end
