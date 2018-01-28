require 'test_helper'

class ChefTest < ActiveSupport::TestCase
  def setup
    @chef = Chef.new(name: "graham", email: "graham@example.com")
  end

  test "recipe should be valid" do
    assert @chef.valid?
  end

  test "name should be present" do
    @chef.name = " "
    assert_not @chef.valid?
  end

   test "name should be less than 30 characters" do
    @chef.name = "a" * 31
    assert_not @chef.valid?
  end

  test "email should be present" do
    @chef.email = " "
    assert_not @chef.valid?
  end

  test "email should not be more than 255 characters" do
    @chef.name = "a" * 245 + "@example.com"
    assert_not @chef.valid?
  end

   test "should reject invalid addresses" do
    invalid_emails = %w[graham@example graham@example,com graham.name@gmail. graham@bar+foo.com]
    invalid_emails.each do |invalids|
      @chef.email = invalids
      assert_not @chef.valid?, "#{invalids.inspect} should be invalid"
    end
  end

  test "email should be unique and case insensitive" do
    duplicate_chef = @chef.dup
    duplicate_chef.email = @chef.email.upcase
    @chef.save
    assert_not duplicate_chef.valid?
  end

end

