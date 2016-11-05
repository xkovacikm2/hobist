class Post < ActiveRecord::Base
  include Filterable

  belongs_to :user
  belongs_to :category
  belongs_to :city

  validates_presence_of :time, :description, :city, :user, :category, :locality
  validates :description, length: {minimum: 10}
  validates :locality, length: {minimum: 5}

  attr_accessor :attendants
end
