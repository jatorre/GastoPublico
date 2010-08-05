class PartidoPolitico < ActiveRecord::Base
  has_many :administracions
end

# == Schema Information
#
# Table name: partido_politicos
#
#  id         :integer         not null, primary key
#  nombre     :string(255)
#  siglas     :string(255)
#  web        :text
#  created_at :datetime
#  updated_at :datetime
#

