#CLI Controller
class CLI
  def call
    puts ""
    puts "Welcome to Snow Report!"
    start
  end

  def start
    puts ""
    puts "Type list to see all of the resorts."
    puts ""
    puts "or"
    puts ""
    puts "Enter a state from the list below to get a list of the resorts in that state:"
    puts ""
    puts "States: #{location}"
    puts ""
    # input = gets.strip
    # while input != "exit"
    list_by_location
    menu
    # end
  end

  def location
    locations = []
    sorted_reports = Scraper.today.sort_by {|report| report.location}
    sorted_reports.each do |report|
      locations << report.location
    end
    locations.uniq.join(", ")
  end


  # how do i build a search by resort method where the user can enter the resort and the report comes up.

    # def find_by_name(name)
    #   name = name.downcase
    #   SnowReport::Report.all.find do |report|
    #     if report.name.downcase == name
    #       report
    #       # binding.pry
    #     end
    #   end
    # end


  def list_by_location
  input = gets.strip.downcase
  @reports = Scraper.today
  @reports.each_with_index do |report, i|
    if report.location.downcase == input
    puts "#{i + 1}. #{report.name}"
  elsif input == "list"
    list_resorts
    break
    end
  end
end

def list_resorts
  puts "Today's Snow Reports:"
  @reports.each_with_index do |report, i|
    puts "#{i + 1}. #{report.name}"
  end
end

    def menu
      input = nil
      while input != "exit"
        puts ""
        puts "Enter the number of the resort you would like a snow report on or type list or exit:"
        puts ""
        input = gets.strip.downcase
        if input.to_i > 0
          the_report = @reports[input.to_i-1]
          puts "-----------#{the_report.name}, #{the_report.location}------------"
          puts ""
          puts ""
          puts "Status: #{the_report.status}"
          puts ""
          puts "New Snow: #{the_report.new_snow}"
          puts ""
          puts "Summit Tempature: #{the_report.temp}"
          puts ""
          puts "Trails Open: #{the_report.trails}"
          puts ""
          puts "Lifts Open: #{the_report.lifts}"
          puts ""
          puts "Parks Open: #{the_report.parks}"
          puts ""
          puts ""
          puts "-----------Description------------"
          puts ""
          puts "#{the_report.description}"
          puts ""
        elsif input == "list"
          list_resorts
        elsif input == "exit"
          puts ""
          puts "See you tomorrow for more reports!!!"
          puts ""
        else
          puts ""
          puts "Not sure what you want, type list or exit."
          puts ""
        end
      end
    end
end
