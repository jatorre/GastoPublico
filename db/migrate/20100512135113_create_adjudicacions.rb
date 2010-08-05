class CreateAdjudicacions < ActiveRecord::Migration
  def self.up
    create_table :adjudicacions do |t|
      t.references :licitacion
      t.references :adjudicatario
      t.float :importe

      t.timestamps
    end
    
    add_index :adjudicacions, :licitacion_id
    add_index :adjudicacions, :adjudicatario_id
  end

  def self.down
    drop_table :adjudicacions
  end
end
