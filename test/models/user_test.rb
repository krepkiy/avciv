require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save user without name" do
    user = User.new(password: "parol")
#    assert !user.save
#    assert user.save, "Saved the user without a name"
    assert_not user.save, "Saved the user without a name"
  end

#  test "should report error" do
#    # some_undefined_variable is not defined elsewhere in the test case
#    assert_raises(NameError) do
#      some_undefined_variable
#    end
    #some_undefined_variable
    #assert true
#  end
end
