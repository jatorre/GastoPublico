require 'test_helper'

class PerfilContratanteTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: perfil_contratantes
#
#  id                         :integer         not null, primary key
#  tipo_perfil_contratante_id :integer
#  nombre                     :string(255)
#  cif                        :string(255)
#  wikipedia_url              :text
#  partido_politico_id        :integer
#  foto                       :text
#  escudo                     :text
#  habitantes                 :integer
#  alcalde_voota_link         :text
#  provincia_id               :integer
#  comunidad_autonoma_id      :integer
#  direccion                  :text
#  poblacion                  :text
#  cp                         :string(255)
#  tlf                        :string(255)
#  fax                        :string(255)
#  web                        :text
#  email                      :string(255)
#  presupuesto_total          :float
#  presupuesto_url            :text
#  created_at                 :datetime
#  updated_at                 :datetime
#  the_geom                   :geometry        point, 4326
#

