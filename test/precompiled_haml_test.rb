require 'test_helper'

class PrecompiledHamlTest < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, PrecompiledHaml
  end
end
