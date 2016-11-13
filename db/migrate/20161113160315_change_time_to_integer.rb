class ChangeTimeToInteger < ActiveRecord::Migration
  def change
    change_column :posts, :time, :integer, default: 0
  end
end
