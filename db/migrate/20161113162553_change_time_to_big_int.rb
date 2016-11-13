class ChangeTimeToBigInt < ActiveRecord::Migration
  def change
    change_column :posts, :time, 'bigint', default: 0
  end
end
