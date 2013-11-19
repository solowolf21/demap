require 'exemplar_builder'
class Exemplars
  extend ExemplarBuilder

  exemplify Movie do |obj, count, overrides|
    obj.title = "Movie#{count}Name"
    obj.rating = "PG-#{rand(14) + 1}"
    obj.released_on = Date.today << 12 * rand(10)
    obj.description = "#{obj.title} is really really good. " * 4
    obj.total_gross = rand(100000000)
  end

end