class Provincia < ActiveRecord::Base
  belongs_to :comunidad_autonoma
  has_many :administracions
end

# == Schema Information
#
# Table name: provincias
#
#  id                    :integer         not null, primary key
#  nombre                :string(255)
#  comunidad_autonoma_id :integer
#  created_at            :datetime
#  updated_at            :datetime
#

