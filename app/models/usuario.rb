class Usuario < ActiveRecord::Base
  has_many :comentarios
end

# == Schema Information
#
# Table name: usuarios
#
#  id         :integer         not null, primary key
#  token      :string(255)
#  nombre     :string(255)
#  email      :string(255)
#  web        :text
#  created_at :datetime
#  updated_at :datetime
#

