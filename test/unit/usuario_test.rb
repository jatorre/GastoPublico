require 'test_helper'

class UsuarioTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: usuarios
#
#  id         :integer         not null, primary key
#  token      :string(255)
#  nombre     :string(255)
#  email      :string(255)
#  web        :text
#  created_at :datetime
#  updated_at :datetime
#

