require 'test_helper'

class ChefsShowTest < ActionDispatch::IntegrationTest

  def setup
    @chef = Chef.create!(name: "graham", email: "graham@example.com",
                     password: "password", password_confirmation: "password")
    @recipe = Recipe.create(name: "Pasta", description: "bolognese",  chef: @chef)
    @recipe2 = @chef.recipes.build(name: "Burger", description: "with cheese")
    @recipe2.save
  end

  test "should get chefs show" do
    sign_in_as(@chef, "password")
    get chef_path(@chef)
    assert_template 'chefs/show'
    assert_select "a[href=?]", recipe_path(@recipe), text: @recipe.name
    assert_select "a[href=?]", recipe_path(@recipe2), text: @recipe2.name
    # assert_match @recipe.description, response.body
    # assert_match @recipe2.description, response.body
    assert_match @chef.name, response.body
  end
end
