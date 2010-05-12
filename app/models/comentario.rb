class Comentario < ActiveRecord::Base
  belongs_to :usario
  belongs_to :licitacion
  belongs_to :tipo_licitacion
end
