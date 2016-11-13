class Post < ActiveRecord::Base
  include Filterable

  mount_uploader :picture, PictureUploader

  belongs_to :user
  has_and_belongs_to_many :users
  belongs_to :category
  belongs_to :city

  validates_presence_of :time, :description, :city, :user, :category, :locality
  validates :description, length: {minimum: 10}
  validates :locality, length: {minimum: 5}

  validates_processing_of :picture

  attr_accessor :attendants, :city_name, :time_from, :time_to, :event_name, :time_at

  scope :event_name, -> (name) { where 'lower(posts.name) like ?', "%#{name.downcase}%" }
  scope :category_id, -> (id) { where category_id: id }
  scope :city_name, -> (name) { joins(:city).where 'cities.name like ?', "#{name}%" }
  scope :time_from, -> (time) { where 'posts.time >= ?', time }
  scope :time_to, -> (time) { where 'posts.time <= ?', time }
  scope :attendants, -> (attendants) { joins(:users).where 'users.name in (?)', attendants }

  after_find do
    self.time_at = DateTime.strptime self.time.to_s, '%s'
    self.city_name = self.city.name
  end

  before_validation do
    self.limited = self.limit > 0
    self.time = self.time_at.to_datetime.to_i unless self.time_at.nil?
  end
end
