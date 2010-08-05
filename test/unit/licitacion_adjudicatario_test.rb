require 'test_helper'

class LicitacionAdjudicatarioTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
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

