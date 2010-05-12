class ComunidadAutonoma < ActiveRecord::Base
  has_many :perfil_contratantes
  has_many :provincias
end
