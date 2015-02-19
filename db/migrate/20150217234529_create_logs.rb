class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.string :issue
      t.text :description
      t.text :tried
      t.text :theories
      t.string :author

      t.timestamps
    end
  end
end
