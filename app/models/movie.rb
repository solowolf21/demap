class Movie < ActiveRecord::Base
  attr_accessible :rating, :title, :total_gross, :description, :released_on, :cast, :director, :duration, :image_file_name

  def flop?
    self.total_gross < 50000000
  end

  def self.released
    Movie.where('released_on < ?', Date.today).order('released_on desc')
  end
end
