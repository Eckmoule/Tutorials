class AddRatingToBooks < ActiveRecord::Migration
  def change
    add_column :books, :rating, :intger
  end
end
