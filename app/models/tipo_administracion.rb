class TipoAdministracion < ActiveRecord::Base
  has_many :administracions
end

# == Schema Information
#
# Table name: tipo_perfil_contratantes
#
#  id         :integer         not null, primary key
#  nombre     :string(255)
#  created_at :datetime
#  updated_at :datetime
#

