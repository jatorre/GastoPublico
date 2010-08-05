class Licitacion < ActiveRecord::Base
  belongs_to :organo_convocante
  belongs_to :tipo_procedimiento
  belongs_to :tipo_licitacion
  belongs_to :estado
  belongs_to :fuente_datos
  belongs_to :programa_financion
  has_many :comentarios
  has_many :adjudicacions
  has_many :adjudicatarios, :through => :adjudicacions
end

# == Schema Information
#
# Table name: licitacions
#
#  id                    :integer         not null, primary key
#  organo_convocante_id  :integer
#  expediente            :string(255)
#  tipo_procedimiento_id :integer
#  tipo_licitacion_id    :integer
#  importe               :float
#  fecha_publicacion     :datetime
#  fecha_adjudicacion    :datetime
#  titulo                :string(255)
#  descripcion           :text
#  codigo_cpv_ppal       :string(255)
#  estado_id             :integer
#  url_licitacion        :text
#  votes_up              :integer         default(0)
#  votes_down            :integer         default(0)
#  num_comentarios       :integer         default(0)
#  ref_publicacion       :text
#  fuente_datos_id       :integer
#  programa_financion_id :integer
#  created_at            :datetime
#  updated_at            :datetime
#  the_geom              :geometry        point, 4326
#

