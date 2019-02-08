class Report
attr_accessor :temp, :lifts, :trails, :new_snow, :parks, :status, :description, :location
attr_reader :name

@@all = []

  def initialize
    @name = name
    @@all << self
  end

  def self.all
    sorted_all = @@all.sort_by {|report| report.name}
    sorted_all
    # binding.pry
  end
end
