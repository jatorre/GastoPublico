class AddPointToLicitationAndComentario < ActiveRecord::Migration
  def self.up
    add_column :licitacions, :the_geom, :point, :srid => 4326, :with_z => false
    add_column :comentarios, :the_geom, :point,:srid => 4326, :with_z => false
    add_column :perfil_contratantes, :the_geom, :point,:srid => 4326, :with_z => false
    add_column :adjudicatarios, :the_geom, :point,:srid => 4326, :with_z => false
  end

  def self.down
    remove_column :licitacions, :the_geom
    remove_column :comentarios, :the_geom
    remove_column :perfil_contratantes, :the_geom
    remove_column :adjudicatarios, :the_geom    
  end
end
