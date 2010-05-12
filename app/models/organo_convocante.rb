class OrganoConvocante < ActiveRecord::Base
  belongs_to :perfil_contratante
  has_many :licitacions
end
