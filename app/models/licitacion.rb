class Licitacion < ActiveRecord::Base
  belongs_to :organo_convocante
  belongs_to :tipo_procedimiento
  belongs_to :tipo_licitacion
  belongs_to :estado
  belongs_to :fuente_datos
  belongs_to :programa_financion
  has_many :commentarios
  has_many :licitacion_adjudicatarios
  has_many :adjudicatarios, :through => :licitacion_adjudicatarios
  
  acts_as_geom :the_geom => :point
end
