class AddImageToBug < ActiveRecord::Migration[5.2]
  def change
    add_column :bugs, :image, :string
  end
end
