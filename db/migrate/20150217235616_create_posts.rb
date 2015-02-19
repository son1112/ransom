class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :test

      t.timestamps
    end
  end
end
