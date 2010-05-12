class CreateLicitacionAdjudicatarios < ActiveRecord::Migration
  def self.up
    create_table :licitacion_adjudicatarios do |t|
      t.references :licitacion
      t.references :adjudicatario
      t.float :importe

      t.timestamps
    end
    
    add_index :licitacion_adjudicatarios, :licitacion_id
    add_index :licitacion_adjudicatarios, :adjudicatario_id
  end

  def self.down
    drop_table :licitacion_adjudicatarios
  end
end
