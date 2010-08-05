class Adjudicacion < ActiveRecord::Base
  belongs_to :licitacion
  belongs_to :adjudicatario
end

# == Schema Information
#
# Table name: licitacion_adjudicatarios
#
#  id               :integer         not null, primary key
#  licitacion_id    :integer
#  adjudicatario_id :integer
#  importe          :float
#  created_at       :datetime
#  updated_at       :datetime
#

