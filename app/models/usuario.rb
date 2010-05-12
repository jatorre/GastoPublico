class Usuario < ActiveRecord::Base
  has_many :comentarios
end
