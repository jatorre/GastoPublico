class ComunidadAutonoma < ActiveRecord::Base
  has_many :administracions
  has_many :provincias
end

# == Schema Information
#
# Table name: comunidad_autonomas
#
#  id         :integer         not null, primary key
#  nombre     :string(255)
#  created_at :datetime
#  updated_at :datetime
#

