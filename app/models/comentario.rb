class Comentario < ActiveRecord::Base
  belongs_to :usuario
  belongs_to :licitacion
  belongs_to :tipo_licitacion
end

# == Schema Information
#
# Table name: comentarios
#
#  id                 :integer         not null, primary key
#  usuario_id         :integer
#  licitacion_id      :integer
#  tipo_licitacion_id :integer
#  comentario         :text
#  is_vote            :boolean
#  created_at         :datetime
#  updated_at         :datetime
#  the_geom           :geometry        point, 4326
#

