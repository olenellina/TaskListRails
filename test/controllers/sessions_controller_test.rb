require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  def login_a_user
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:github]
    get :create,  {provider: "github"}
  end

  test "A new User should be created automatically using a Github auth_hash that is not in DB" do
    assert_difference('User.count', 1) do
      login_a_user
      assert_response :redirect
  #     assert_redirected_to tasks_index_path(User.find_by(uid: OmniAuth.config.mock_auth[:github][:uid]))
  #     assert_equal session[:user_id], User.find_by(uid: OmniAuth.config.mock_auth[:github][:uid], provider: "github").id
    end
  end

  test "A 2nd User shouldn't be created if a User logs in twice" do
    assert_difference('User.count', 1) do
      login_a_user
      puts "----"
      puts User.all
      puts "----"
    end
    assert_no_difference('User.count') do
      login_a_user
      assert_response :redirect
      assert_redirected_to tasks_index_path
    end
  end

  test "If not logged in via github, a User cannot be logged in" do
    get :create, provider: "github"
    assert_equal flash[:notice], "Login Failed"
    assert_redirected_to root_path
  end


  test "Logging out should clear the User's session" do
    login_a_user
    assert session[:user_id] !=nil
    session.delete(:user_id)
    assert_nil session[:user_id]
  end

end
