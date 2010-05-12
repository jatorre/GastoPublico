class Provincia < ActiveRecord::Base
  belongs_to :comunidad_autonoma
  has_many :perfil_contratantes
end
