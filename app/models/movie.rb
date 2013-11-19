class Movie < ActiveRecord::Base
  attr_accessible :rating, :title, :total_gross

  def flop?
    self.total_gross < 50000000
  end
end
