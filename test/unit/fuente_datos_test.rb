require 'test_helper'

class FuenteDatosTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: fuente_datos
#
#  id                 :integer         not null, primary key
#  nombre             :string(255)
#  ultima_importacion :datetime
#  web                :text
#  created_at         :datetime
#  updated_at         :datetime
#

