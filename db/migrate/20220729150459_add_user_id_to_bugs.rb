class AddUserIdToBugs < ActiveRecord::Migration[5.2]
  def change
    add_reference :bugs, :user, foreign_key: true
  end
end
