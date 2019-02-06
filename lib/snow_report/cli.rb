#CLI Controller
class SnowReport::CLI


  def call
    list_reports
    menu
    goodbye
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
        puts "-----------#{the_report.name}------------"
        puts ""
        puts "Status: #{the_report.status}"
        puts "Summit Tempature: #{the_report.temp}"
        puts "Trails Open: #{the_report.trails}"
        puts "Lifts Open: #{the_report.lifts}"
        puts "New Snow: #{the_report.new_snow}"
        puts "Parks Open: #{the_report.parks}"
        puts "Website: #{the_report.url}"
        puts ""
        # puts -----------#description------------
        # puts ""
        # puts "#{the_report.description}"
        # puts ""
      elsif input == "list"
        list_reports
      else
        puts "Not sure what you want, type list or exit."
      end
    end
  end
def goodbye
  puts "See you tomorrow for more reports!!"
end


end
