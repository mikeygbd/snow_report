
class SnowReport::Report
attr_accessor :name, :temp, :lifts, :trails, :new_snow, :parks, :status, :url
  def self.today
    #scrape snow report sites
  self.scrape_reports
  end

  def self.scrape_reports
    reports = []
  #
    reports << self.scrape_mountsnow
    reports << self.scrape_stratton
    reports << self.scrape_hunter
    reports << self.scrape_mountaincreek
    reports << self.scrape_jaypeak
    reports << self.scrape_stowe

  #   # reports << self.scrape_hunter
  #   # reports << self.scrape_stratton
  #
  #   #go to snow report websites
  #   #extract the properties
  #   #instantiate the reports
  #   #go to mountsnow...
  #   # report_1 = self.new
  #   # report_1.name = "Mount Snow"
  #   # report_1.temp = "45"
  #   # report_1.lifts = "9"
  #   # report_1.trails = "82"
  #   # report_1.url = "https://www.mountsnow.com/ski-ride/snow-report/"
  #   #
  #   # report_2 = self.new
  #   # report_2.name = "Hunter"
  #   # report_2.temp = "31"
  #   # report_2.lifts = "9"
  #   # report_2.trails = "82"
  #   # report_2.url = "https://www.huntermtn.com/mountain-info/snow-report/"
  #   #
  #   # report_3 = self.new
  #   # report_3.name = "Stratton"
  #   # report_3.temp = "31"
  #   # report_3.lifts = "9"
  #   # report_3.trails = "86"
  #   # report_3.url = "https://www.onthesnow.com/vermont/stratton-mountain/skireport.html"
  #   #
  #   # [report_1, report_2, report_3]
    reports
  end
  #
  def self.scrape_mountsnow
    doc = Nokogiri::HTML(open("https://www.mountsnow.com/ski-ride/snow-report/"))
    doc2 = Nokogiri::HTML(open("https://www.onthesnow.com/vermont/mount-snow/ski-resort.html"))
    report = self.new
    report.name = doc2.search(".resort_name").text
    report.status = doc2.search(".current_status").text
    report.trails = doc.search(".value").first.text
    report.lifts = doc.search(".value")[1].text
    report.temp = doc.search(".value")[9].text
    report.new_snow = doc.search(".value")[4].text
    report.parks = doc.search(".value")[17].text
    # binding.pry
  end

  def self.scrape_stratton
    doc = Nokogiri::HTML(open("https://www.onthesnow.com/vermont/stratton-mountain/skireport.html"))
    report = self.new
    report.name = doc.search(".resort_name").text
    report.status = doc.search(".current_status").text
    report.trails = doc.search("#resort_terrain p.open").first.text
    report.lifts = doc.search("#resort_terrain p.open")[1].text
    report.temp = doc.search(".temp.above").first.text
    report.new_snow = doc.search(".predicted_snowfall")[6].text
    report.parks = doc.search("#resort_terrain p.value")[3].text
    report.url = doc.search(".resort_name a").attr("href").value
    report
    # binding.pry
  end

  def self.scrape_hunter
    doc = Nokogiri::HTML(open("https://www.onthesnow.com/new-york/hunter-mountain/skireport.html"))
    report = self.new
    report.name = doc.search(".resort_name").text
    report.status = doc.search(".current_status").text
    report.trails = doc.search("#resort_terrain p.open").first.text
    report.lifts = doc.search("#resort_terrain p.open")[1].text
    report.temp = doc.search(".temp.above").first.text
    report.new_snow = doc.search(".predicted_snowfall")[6].text
    report.parks = doc.search("#resort_terrain p.value")[3].text
    report
    # binding.pry
  end

  def self.scrape_mountaincreek
    doc = Nokogiri::HTML(open("https://www.onthesnow.com/new-jersey/mountain-creek-resort/skireport.html"))
    report = self.new
    report.name = doc.search(".resort_name").text
    report.status = doc.search(".current_status").text
    report.trails = doc.search("#resort_terrain p.open").first.text
    report.lifts = doc.search("#resort_terrain p.open")[1].text
    report.temp = doc.search(".temp.below").first.text
    report.new_snow = doc.search(".predicted_snowfall")[6].text
    report.parks = doc.search("#resort_terrain p.value")[3].text

    # binding.pry
      report
  end

  def self.scrape_jaypeak
    doc = Nokogiri::HTML(open("https://www.onthesnow.com/vermont/jay-peak/skireport.html"))
    report = self.new
    name = doc.search(".resort_name").text
    status = doc.search(".current_status").text
    trails = doc.search("#resort_terrain p.open").first.text
    lifts = doc.search("#resort_terrain p.open")[1].text
    temp = doc.search(".temp.above").first.text
    new_snow = doc.search(".predicted_snowfall")[6].text
    parks = doc.search("#resort_terrain p.value")[3].text
    url = doc.search(".resort_name a").attr("href").value
    report
    # binding.pry
  end

  def self.scrape_stowe
    doc = Nokogiri::HTML(open("https://www.onthesnow.com/vermont/stowe-mountain-resort/skireport.html"))
    report = self.new
    name = doc.search(".resort_name").text
    status = doc.search(".current_status").text
    trails = doc.search("#resort_terrain p.open").first.text
    lifts = doc.search("#resort_terrain p.open")[1].text
    temp = doc.search(".temp.above").first.text
    new_snow = doc.search(".predicted_snowfall")[6].text
    # parks = doc.search("#resort_terrain p.value")[3].text -- no parks at stowe
    report
    # binding.pry
  end

end
