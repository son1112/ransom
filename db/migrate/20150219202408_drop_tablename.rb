class DropTablename < ActiveRecord::Migration
  def up
    drop_table :videos
  end

  def down
    create_table :videos do |t|
      t.string :name
      t.attachment :encoding

      t.timestamps        
    end
    add_index :tablenames, :anothertable_id
  end
end
