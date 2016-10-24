require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "An user must have a unique username" do
    assert_equal users(:user_one).username, "Ada"
    users(:user_one).username = nil
    assert_not users(:user_one).valid?
  end

  test "A user must have a unique email address" do
    assert_equal users(:user_two).email, "bab@ada.com"
    users(:user_two).email = nil
    assert_not users(:user_two).valid?
  end

  test "A user can have a name but doesn't have to" do
    assert_equal users(:user_one).name, "Ada Lovelace"
    assert users(:user_one).valid?
    assert_equal users(:user_two).name, nil
    assert users(:user_two).valid?
  end

end
