class Comentario < ActiveRecord::Base
  belongs_to :usuario
  belongs_to :licitacion
  belongs_to :tipo_licitacion
  acts_as_geom :the_geom => :point  
end
