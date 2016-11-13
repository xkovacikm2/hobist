class ChangeTimeToInteger < ActiveRecord::Migration
  def change
    remove_column :posts, :time
    add_column :posts, :time, :integer, default: 0
  end
end
