class TipoLicitacion < ActiveRecord::Base
  has_many :licitacions
end

# == Schema Information
#
# Table name: tipo_licitacions
#
#  id         :integer         not null, primary key
#  nombre     :string(255)
#  created_at :datetime
#  updated_at :datetime
#

