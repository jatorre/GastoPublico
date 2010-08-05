class Adjudicatario < ActiveRecord::Base
  has_many :adjudicacions
  has_many :licitacions, :through => :adjudicacions
end

# == Schema Information
#
# Table name: adjudicatarios
#
#  id         :integer         not null, primary key
#  cif        :string(255)
#  nombre     :string(255)
#  direction  :text
#  poblacion  :string(255)
#  cp         :string(255)
#  tlf        :string(255)
#  fax        :string(255)
#  email      :string(255)
#  web        :text
#  created_at :datetime
#  updated_at :datetime
#  the_geom   :geometry        point, 4326
#

