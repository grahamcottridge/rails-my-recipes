require 'test_helper'

class ChefsLoginTest < ActionDispatch::IntegrationTest
  test "invalid login is rejected" do
  get login_path
  assert_template 'sessions/new'
  end

  test "ivalid login credentials accepted and begin session" do
  get login_path
  assert_template 'sessions/new'
  end
end
