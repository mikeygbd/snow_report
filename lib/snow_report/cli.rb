#CLI Controller
class SnowReport::CLI
  attr_accessor  :name, :temp, :trails

  def call
    list_reports
    menu
    goodbye
  end

  def list_reports
    puts "Today's Snow Reports:"
    @reports = SnowReport::Report.today
    @reports.each_with_index do |report, i|
      puts "#{i + 1}. #{report.name} - #{report.temp} - #{report.trails}"
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the mountain you would like a report on or type list/exit:"
      input = gets.strip
      if input.to_i > 0
        the_report = @reports[input.to_i-1]
        puts "#{the_report.name} - #{the_report.temp} - #{the_report.trails}"
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
