class CreateProgramaFinanciacions < ActiveRecord::Migration
  def self.up
    create_table :programa_financiacions do |t|
      t.string :nombre
      t.string :nivel

      t.timestamps
    end
  end

  def self.down
    drop_table :programa_financiacions
  end
end
