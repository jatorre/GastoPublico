class Adjudicatario < ActiveRecord::Base
  has_many :licitacion_adjudicatarios
  has_many :licitacions, :through => :licitacion_adjudicatarios
end
