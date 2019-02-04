class SnowReport::Report
attr_accessor :name, :temp, :lifts, :trails, :url
  def self.today
    #should return a bunch of instances of report
    puts <<-DOC.gsub /^\s*/, ''
    1. Mount Snow
    2. Hunter
    3. Stratton
    DOC

    report_1 = self.new
    report_1.name = "Mount Snow"
    report_1.temp = "31"
    report_1.lifts = "9"
    report_1.trails = "82"
    report_1.url = "https://www.mountsnow.com/ski-ride/snow-report/"

    report_2 = self.new
    report_2.name = "Hunter"
    report_2.temp = "31"
    report_2.lifts = "9"
    report_2.trails = "82"
    report_2.url = "https://www.huntermtn.com/mountain-info/snow-report/"

    report_3 = self.new
    report_3.name = "Stratton"
    report_3.temp = "31"
    report_3.lifts = "9"
    report_3.trails = "82"
    report_3.url = "https://www.onthesnow.com/vermont/stratton-mountain/skireport.html"

    [report_1, report_2, report_3]

  end

end
