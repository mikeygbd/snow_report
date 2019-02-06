#CLI Controller
class SnowReport::CLI


  def call
    list_reports
    menu
    # goodbye
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
        puts "Enter the number of the mountain you would like a report on or type list/exit:"
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
