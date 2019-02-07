#CLI Controller
class SnowReport::CLI


  def call
    puts ""
    puts "Welcome to Snow Report!"
    start
  end

  def start
    puts ""
    puts "Type list to see all of the resorts"
    puts ""
    puts "or"
    puts ""
    puts "Enter a state from the list below to get a list of the resorts in that state:"
    puts ""
    puts "States: \nCalifornia \nNew York \nNew Jersey \nNew Hampshire \nVermont \nMontana \nAlaska \nPennsylvania "
    puts ""
    list_by_location
    menu
  end

  #how do i build a search by resort method where the user can enter the resort and the report comes up.

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
  @reports = SnowReport::Report.today
  @reports.each_with_index do |report, i|
    if report.location.downcase == input
    puts "#{i + 1}. #{report.name}"
  elsif input == "list"
    list_reports
    break
    end
  end
end

  def list_reports
    puts "Today's Snow Reports:"
    @reports = SnowReport::Report.today
    @reports.each_with_index do |report, i|
      puts "#{i + 1}. #{report.name}"
    end
  end

    def menu
      input = nil
      while input != "exit"
        puts "Enter the number of the resort you would like a snow report on or type list or exit:"
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
          puts "Website: #{the_report.url}"
          puts ""
          puts ""
          puts "-----------Description------------"
          puts ""
          puts "#{the_report.description}"
          puts ""
        elsif input == "list"
          list_reports
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
