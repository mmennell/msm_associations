class Movie < ActiveRecord::Base
  validates(:director_id, { :presence => true})
  validates(:title, { :presence => true})
  validates(:title, uniqueness: { scope: :year })
  validates(:year, numericality: { only_integer: true })
  validates(:year, numericality: { greater_than: 1850 })
  validates(:year, numericality: { less_than: 2050 })
  validates(:duration, numericality: { only_integer: true })
  validates(:duration, numericality: { greater_than: 0 })
  validates(:duration, numericality: { less_than: 2764800 })
  belongs_to :director, :class_name => "Director", :foreign_key => "director_id"
  has_many :characters, :class_name => "Character", :foreign_key => "movie_id"
  has_many :actors, :through => :characters, :class_name => "Actor", :foreign_key => "movie_id"

end
