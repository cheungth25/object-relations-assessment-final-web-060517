class Movie
  attr_accessor :title
  @@all = []

  def initialize(title)
    self.title = title
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_title(title)
    self.all.detect { |movie| movie.title == title}
  end

  def ratings
    Rating.all.select { |rating| rating.movie == self}
  end

  def viewers
    self.ratings.map { |rating| rating.viewer}
  end

  def average_rating
    sum = 0
    count = 0
    self.ratings.each do |rating|
      count += 1
      sum += rating.score
    end
    sum/count.to_f
  end
end
