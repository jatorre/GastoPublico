require 'test_helper'

class ProvinciaTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: provincias
#
#  id                    :integer         not null, primary key
#  nombre                :string(255)
#  comunidad_autonoma_id :integer
#  created_at            :datetime
#  updated_at            :datetime
#

