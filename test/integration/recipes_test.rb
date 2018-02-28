require 'test_helper'

class RecipesTest < ActionDispatch::IntegrationTest

  def setup
    @chef = Chef.create!(name: "graham", email: "graham@example.com")
    @recipe = Recipe.create(name: "Pasta", description: "bolognese",  chef: @chef)
    @recipe2 = @chef.recipes.build(name: "Burger", description: "with cheese")
    @recipe2.save
  end

  test "should get recipes index" do
    get recipes_url
    assert_response :success
  end

  test "should get recipes listing" do
    get recipes_path
    assert_template 'recipes/index'
    assert_select "a[href=?]", recipe_path(@recipe), text: @recipe.name
    assert_select "a[href=?]", recipe_path(@recipe2), text: @recipe2.name
  end

  test "should get recipes show" do
    get recipe_path(@recipe)
    assert_template 'recipes/show'
    assert_match @recipe.name, response.body
    assert_match @recipe.description, response.body
    assert_match @chef.name, response.body
  end

  test "create new valid recipe" do
    get new_recipe_path
  end

  test "reject invalid recipe submissions" do
    get new_recipe_path
  end

end
