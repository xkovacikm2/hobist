class Post < ActiveRecord::Base
  include Filterable

  belongs_to :user
  has_and_belongs_to_many :users
  belongs_to :category
  belongs_to :city

  validates_presence_of :time, :description, :city, :user, :category, :locality
  validates :description, length: {minimum: 10}
  validates :locality, length: {minimum: 5}

  attr_accessor :attendants, :city_name, :time_from, :time_to, :event_name

  scope :event_name, -> (name) { where 'posts.name like ?', "%#{name}%" }
  scope :category_id, -> (id) { where category_id: id }
  scope :city_name, -> (name) { joins(:city).where 'cities.name like ?', "#{name}%" }
  scope :time_from, -> (time) { where 'datetime(posts.time) >= datetime(?)', time }
  scope :time_to, -> (time) { where 'datetime(posts.time) <= datetime(?)', time }
  scope :attendants, -> (attendants) { joins(:users).where 'users.name in (?)', attendants }
end
