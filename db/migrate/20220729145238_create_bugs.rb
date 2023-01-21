class CreateBugs < ActiveRecord::Migration[5.2]
  def change
    create_table :bugs do |t|
      t.string :title
      t.datetime :deadline
      t.string :status
      t.string :description
      t.string :bug_type

      t.timestamps
    end
  end
end
