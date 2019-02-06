#CLI Controller
class SnowReport::CLI


  def call
    puts ""
    puts "Welcome to Snow Report!"
    list_by_location
    menu
    # find_by_name
    # puts ""
    # puts "Your options are:"
    # puts ""
    # puts "Type 'list' to see all of the resorts"
    # puts ""
    # puts "Enter a state to get a list of all the resorts in your state:"
    # puts ""
    # puts "or"
    # puts ""
    # puts "Enter a resort name to find the snow report for that resort."
    # # input = nil
    # # while input != "exit"
    # input = gets.strip.downcase
    # @reports = SnowReport::Report.today
    # @reports.each do |report|
    # if input == report.name.downcase
    #   find_by_name(input)
    # elsif input == report.location
    #   list_by_location
    # elsif input == "list"
    #   list_reports
    # else
    #   "Not sure what you want."
    #   call
      # end
    # end
  end
  #how do i build a search by resort method where the user can enter the resort and the report comes up.


    def find_by_name(name)
      name = name.downcase
      SnowReport::Report.all.find do |report|
        if report.name.downcase == name
          report
          # binding.pry
        end
      end
    end


  def list_by_location
   puts ""
  puts "Type list to see all of the resorts"
  puts ""
  puts "or"
  puts ""
  puts "Enter a state to get a list of all the resorts in your state:"
  puts ""
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
        puts "Enter the number of the resort you would like a report on or type list or exit:"
        input = gets.strip.downcase
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
          puts ""
          puts "See you tomorrow for more reports!!!"
          puts ""
        else
          puts "Not sure what you want, type list or exit."
        end
      end
    end
end
