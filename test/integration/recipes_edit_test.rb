require 'test_helper'

class RecipesEditTest < ActionDispatch::IntegrationTest

  def setup
    @chef = Chef.create!(name: "graham", email: "graham@example.com")
    @recipe = Recipe.create(name: "Pasta", description: "bolognese",  chef: @chef)
  end

  test "reject invalid recipe update" do
    get edit_recipe_path(@recipe) # get recipe id path
    assert_template 'recipes/edit'
    patch recipe_path(@recipe), params: { recipe: {name: " ", desciption: "some description"}}
    assert_template 'recipes/edit'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end

  test  "successfully edit a recipe" do

  end

end
