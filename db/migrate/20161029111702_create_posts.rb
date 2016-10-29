class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name, null: false, default: ''
      t.text :description, null: false
      t.date :date, null: false
      t.time :time, null: false
      t.float :entry_fee, default: 0
      t.boolean :limited, default:false
      t.integer :limit
      t.references :city, null: false
      t.references :user, null: false
      t.references :category, null: false
      t.string :locality, null: false

      t.timestamps null: false
    end
  end
end
