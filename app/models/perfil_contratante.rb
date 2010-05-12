class PerfilContratante < ActiveRecord::Base
  belongs_to :tipo_perfil_contratante
  belongs_to :partido_politico
  belongs_to :provincia
  belongs_to :comunidad_autonoma
  has_many :organo_convocantes
  acts_as_geom :the_geom => :point
end
