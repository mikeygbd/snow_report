#CLI Controller
class SnowReport::CLI

  def call
    puts "Today's Snow Reports:"
    list_reports
    menu
    goodbye
  end

  def list_reports
    puts "Today's Snow Reports:"
    @report = SnowReport::Report.today
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the mountain you would like a report on or type list/exit:"
      input = gets.strip
      if input.to_i > 0
        puts @report[input.to_i-1]
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
