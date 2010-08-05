require 'test_helper'

class ComentarioTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: comentarios
#
#  id                 :integer         not null, primary key
#  usuario_id         :integer
#  licitacion_id      :integer
#  tipo_licitacion_id :integer
#  comentario         :text
#  is_vote            :boolean
#  created_at         :datetime
#  updated_at         :datetime
#  the_geom           :geometry        point, 4326
#

