class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  belongs_to :city

  validates_presence_of :date, :time, :description, :city, :user, :category, :locality
  validates :description, length: {minimum: 10}
  validates :name, length: {minimum: 3}
  validates :locality, length: {minimum: 5}
end
