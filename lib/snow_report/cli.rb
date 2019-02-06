#CLI Controller
class SnowReport::CLI


  def call
    puts ""
    puts "Welcome to Snow Report!"
    list_by_location
    # list_reports
    menu
    # goodbye
  end

  #how do i go down another level and ask the user for the state he would liek to see all the reports in.
  def list_by_location

    puts ""
    puts "Type list to see all of the resorts"
    puts ""
    puts "or"
    puts ""
    puts "Enter a state to get a list of all the resorts in your state:"
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
        puts "Enter the number of the resort you would like a report on or type list/exit:"
        input = gets.strip
        if input.to_i > 0
          the_report = @reports[input.to_i-1]
          puts "-----------#{the_report.name}, #{the_report.location}------------"
          puts ""
          puts ""
          puts "Status: #{the_report.status}"
          puts ""
          puts "Summit Tempature: #{the_report.temp}"
          puts ""
          puts "Trails Open: #{the_report.trails}"
          puts ""
          puts "Lifts Open: #{the_report.lifts}"
          puts ""
          puts "New Snow: #{the_report.new_snow}"
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
           puts "See you tomorrow for more reports!!!"
        else
          puts "Not sure what you want, type list or exit."
        end
      end
    end
end
