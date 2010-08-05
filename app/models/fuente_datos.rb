class FuenteDatos < ActiveRecord::Base
  has_many :licitacions
end

# == Schema Information
#
# Table name: fuente_datos
#
#  id                 :integer         not null, primary key
#  nombre             :string(255)
#  ultima_importacion :datetime
#  web                :text
#  created_at         :datetime
#  updated_at         :datetime
#

