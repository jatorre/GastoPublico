class PartidoPolitico < ActiveRecord::Base
  has_many :perfil_contratantes
end
