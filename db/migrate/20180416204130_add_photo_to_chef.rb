class AddPhotoToChef < ActiveRecord::Migration[5.1]
  def change
    add_column :chefs, :photo, :string
  end
end
