class AddVideoColumnToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :video, :attachment 
  end
end
