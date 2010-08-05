class OrganoContratacion < ActiveRecord::Base
  belongs_to :perfil_contratante
  has_many :licitacions
end

# == Schema Information
#
# Table name: organo_convocantes
#
#  id                    :integer         not null, primary key
#  perfil_contratante_id :integer
#  nombre                :text
#  direccion             :string(255)
#  poblacion             :string(255)
#  cp                    :string(255)
#  tlf                   :string(255)
#  fax                   :string(255)
#  email                 :string(255)
#  web                   :text
#  created_at            :datetime
#  updated_at            :datetime
#

