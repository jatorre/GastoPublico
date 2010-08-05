require 'test_helper'

class PartidoPoliticoTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: partido_politicos
#
#  id         :integer         not null, primary key
#  nombre     :string(255)
#  siglas     :string(255)
#  web        :text
#  created_at :datetime
#  updated_at :datetime
#

