class Movie < ActiveRecord::Base
  attr_accessible :rating, :title, :total_gross
end
