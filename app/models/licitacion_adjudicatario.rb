class LicitacionAdjudicatario < ActiveRecord::Base
  belongs_to :licitacion
  belongs_to :adjudicatario
  has_many :licitations
  has_many :commentarios
end
