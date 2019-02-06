
class SnowReport::Report

attr_accessor :name, :temp, :lifts, :trails, :new_snow, :parks, :status, :url, :description, :location

  def self.today
  self.scrape_reports
  end

  def self.scrape_reports
    reports = []
    reports << self.scrape_mountsnow
    reports << self.scrape_stratton
    reports << self.scrape_hunter
    reports << self.scrape_mountaincreek
    reports << self.scrape_jaypeak
    reports << self.scrape_stowe
    reports << self.scrape_whiteface
    reports << self.scrape_belleayre
    reports << self.scrape_windham
    reports
  end


  def self.scrape_mountsnow
    doc = Nokogiri::HTML(open("https://www.onthesnow.com/vermont/mount-snow/skireport.html"))
    report = self.new
    report.name = doc.search(".resort_name").text
    report.location = doc.search(".relatedRegions a").first.text
    report.status = doc.search(".current_status").text
    report.trails = doc.search("#resort_terrain p.open").first.text
    report.lifts = doc.search("#resort_terrain p.open")[1].text
    report.temp = doc.search(".temp").first.text
    report.new_snow = doc.search(".predicted_snowfall")[6].text
    report.parks = doc.search("#resort_terrain p.value")[3].text
    report.description = doc.search(".snow_report_comment_wrapper").text
    report
    # binding.pry
  end

  def self.scrape_stratton
    doc = Nokogiri::HTML(open("https://www.onthesnow.com/vermont/stratton-mountain/skireport.html"))
    report = self.new
    report.name = doc.search(".resort_name").text
    report.location = doc.search(".relatedRegions a").first.text
    report.status = doc.search(".current_status").text
    report.trails = doc.search("#resort_terrain p.open").first.text
    report.lifts = doc.search("#resort_terrain p.open")[1].text
    report.temp = doc.search(".temp").first.text
    report.new_snow = doc.search(".predicted_snowfall")[6].text
    report.parks = doc.search("#resort_terrain p.value")[3].text
    report.url = doc.search(".resort_name a").attr("href").value
    report.description = doc.search(".snow_report_comment_wrapper").text
    report
    # binding.pry
  end

  def self.scrape_hunter
    doc = Nokogiri::HTML(open("https://www.onthesnow.com/new-york/hunter-mountain/skireport.html"))
    report = self.new
    report.name = doc.search(".resort_name").text
    report.location = doc.search(".relatedRegions a").first.text
    report.status = doc.search(".current_status").text
    report.trails = doc.search("#resort_terrain p.open").first.text
    report.lifts = doc.search("#resort_terrain p.open")[1].text
    report.temp = doc.search(".temp").first.text
    report.new_snow = doc.search(".predicted_snowfall")[6].text
    report.parks = doc.search("#resort_terrain p.value")[3].text
    report.description = doc.search(".snow_report_comment_wrapper").text
    report
    # binding.pry
  end

  def self.scrape_mountaincreek
    doc = Nokogiri::HTML(open("https://www.onthesnow.com/new-jersey/mountain-creek-resort/skireport.html"))
    report = self.new
    report.name = doc.search(".resort_name").text
    report.location = doc.search(".relatedRegions a").first.text
    report.status = doc.search(".current_status").text
    report.trails = doc.search("#resort_terrain p.open").first.text
    report.lifts = doc.search("#resort_terrain p.open")[1].text
    report.temp = doc.search(".temp").first.text
    report.new_snow = doc.search(".predicted_snowfall")[6].text
    report.parks = doc.search("#resort_terrain p.value")[3].text
    report.description = doc.search(".snow_report_comment_wrapper").text
    # binding.pry
      report
  end

  def self.scrape_jaypeak
    doc = Nokogiri::HTML(open("https://www.onthesnow.com/vermont/jay-peak/skireport.html"))
    report = self.new
    report.name = doc.search(".resort_name").text
    report.location = doc.search(".relatedRegions a").first.text
    report.status = doc.search(".current_status").text
    report.trails = doc.search("#resort_terrain p.open").first.text
    report.lifts = doc.search("#resort_terrain p.open")[1].text
    report.temp = doc.search(".temp").first.text
    report.new_snow = doc.search(".predicted_snowfall")[6].text
    report.parks = doc.search("#resort_terrain p.value")[3].text
    report.url = doc.search(".resort_name a").attr("href").value
    report.description = doc.search(".snow_report_comment_wrapper").text
    report
    # binding.pry
  end

  def self.scrape_stowe
    doc = Nokogiri::HTML(open("https://www.onthesnow.com/vermont/stowe-mountain-resort/skireport.html"))
    report = self.new
    report.name = doc.search(".resort_name").text
    report.location = doc.search(".relatedRegions a").first.text
    report.status = doc.search(".current_status").text
    report.trails = doc.search("#resort_terrain p.open").first.text
    report.lifts = doc.search("#resort_terrain p.open")[1].text
    report.temp = doc.search(".temp").first.text
    report.new_snow = doc.search(".predicted_snowfall")[6].text
    # parks = doc.search("#resort_terrain p.value")[3].text -- no parks at stowe
    report.description = doc.search(".snow_report_comment_wrapper").text
    report
    # binding.pry
  end

  def self.scrape_whiteface
    doc = Nokogiri::HTML(open("https://www.onthesnow.com/new-york/whiteface-mountain-resort/skireport.html"))
    report = self.new
    report.name = doc.search(".resort_name").text
    report.location = doc.search(".relatedRegions a").first.text
    report.status = doc.search(".current_status").text
    report.trails = doc.search("#resort_terrain p.open").first.text
    report.lifts = doc.search("#resort_terrain p.open")[1].text
    report.temp = doc.search(".temp").first.text
    report.new_snow = doc.search(".predicted_snowfall")[6].text
    report.parks = doc.search("#resort_terrain p.value")[3].text
    report.url = doc.search(".resort_name a").attr("href").value
    report.description = doc.search(".snow_report_comment_wrapper").text
    report
    # binding.pry
  end

  def self.scrape_belleayre
    doc = Nokogiri::HTML(open("https://www.onthesnow.com/new-york/belleayre/skireport.html"))
    report = self.new
    report.name = doc.search(".resort_name").text
    report.location = doc.search(".relatedRegions a").first.text
    report.status = doc.search(".current_status").text
    report.trails = doc.search("#resort_terrain p.open").first.text
    report.lifts = doc.search("#resort_terrain p.open")[1].text
    report.temp = doc.search(".temp").first.text
    report.new_snow = doc.search(".predicted_snowfall")[6].text
    report.parks = doc.search("#resort_terrain p.value")[3].text
    report.url = doc.search(".resort_name a").attr("href").value
    report.description = doc.search(".snow_report_comment_wrapper").text
    report
    # binding.pry
  end

  def self.scrape_windham
    doc = Nokogiri::HTML(open("https://www.onthesnow.com/new-york/windham-mountain/skireport.html"))
    report = self.new
    report.name = doc.search(".resort_name").text
    report.location = doc.search(".relatedRegions a").first.text
    report.status = doc.search(".current_status").text
    report.trails = doc.search("#resort_terrain p.open").first.text
    report.lifts = doc.search("#resort_terrain p.open")[1].text
    report.temp = doc.search(".temp").first.text
    report.new_snow = doc.search(".predicted_snowfall")[6].text
    report.parks = doc.search("#resort_terrain p.value")[3].text
    report.url = doc.search(".resort_name a").attr("href").value
    report.description = doc.search(".snow_report_comment_wrapper").text
    report
    # binding.pry
  end

end
