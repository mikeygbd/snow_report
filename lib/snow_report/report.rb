
class SnowReport::Report

attr_accessor :name, :temp, :lifts, :trails, :new_snow, :parks, :status, :url, :description, :location


  def self.today
  self.scrape_reports
  end

  def self.scrape_reports
    reports = []
    reports << self.scrape_bear
    reports << self.scrape_attitash
    reports << self.scrape_belleayre
    reports << self.scrape_bigboulder
    reports << self.scrape_bigsky
    reports << self.scrape_boreal
    reports << self.scrape_bromley
    reports << self.scrape_camelback
    reports << self.scrape_eaglecrest
    reports << self.scrape_greekpeak
    reports << self.scrape_gore
    reports << self.scrape_heavenly
    reports << self.scrape_hunter
    reports << self.scrape_jaypeak
    reports << self.scrape_killington
    reports << self.scrape_kirkwood
    reports << self.scrape_loon
    reports << self.scrape_mammoth
    reports << self.scrape_mountsnow
    reports << self.scrape_mountaincreek
    reports << self.scrape_northstar
    reports << self.scrape_okemo
    reports << self.scrape_sevensprings
    reports << self.scrape_sqauwvalley
    reports << self.scrape_stowe
    reports << self.scrape_stratton
    reports << self.scrape_sugarbush
    reports << self.scrape_whiteface
    reports << self.scrape_whitefish
    reports << self.scrape_windham

    sorted_reports = reports.sort_by {|report| report.name}
    sorted_reports
    # binding.pry
  end


  def self.scrape_mountsnow
    doc = Nokogiri::HTML(open("https://www.onthesnow.com/vermont/mount-snow/skireport.html"))
    report = self.new
    report.name = doc.css(".resort_name").text
    report.location = doc.css(".relatedRegions a").first.text
    report.status = doc.css(".current_status").text
    report.trails = doc.css("#resort_terrain p.open").first.text
    report.lifts = doc.css("#resort_terrain p.open")[1].text
    report.temp = doc.css(".temp").first.text
    report.new_snow = doc.css(".predicted_snowfall")[6].text
    report.parks = doc.css("#resort_terrain p.value")[3].text
    report.description = doc.css(".snow_report_comment_wrapper").text
    report
    # binding.pry
  end

  def self.scrape_stratton
    doc = Nokogiri::HTML(open("https://www.onthesnow.com/vermont/stratton-mountain/skireport.html"))
    report = self.new
    report.name = doc.css(".resort_name").text
    report.location = doc.css(".relatedRegions a").first.text
    report.status = doc.css(".current_status").text
    report.trails = doc.css("#resort_terrain p.open").first.text
    report.lifts = doc.css("#resort_terrain p.open")[1].text
    report.temp = doc.css(".temp").first.text
    report.new_snow = doc.css(".predicted_snowfall")[6].text
    report.parks = doc.css("#resort_terrain p.value")[3].text
    report.url = doc.css(".resort_name a").attr("href").value
    report.description = doc.css(".snow_report_comment_wrapper").text
    report
    # binding.pry
  end

  def self.scrape_hunter
    doc = Nokogiri::HTML(open("https://www.onthesnow.com/new-york/hunter-mountain/skireport.html"))
    report = self.new
    report.name = doc.css(".resort_name").text
    report.location = doc.css(".relatedRegions a").first.text
    report.status = doc.css(".current_status").text
    report.trails = doc.css("#resort_terrain p.open").first.text
    report.lifts = doc.css("#resort_terrain p.open")[1].text
    report.temp = doc.css(".temp").first.text
    report.new_snow = doc.css(".predicted_snowfall")[6].text
    report.parks = doc.css("#resort_terrain p.value")[3].text
    report.description = doc.css(".snow_report_comment_wrapper").text
    report
    # binding.pry
  end

  def self.scrape_mountaincreek
    doc = Nokogiri::HTML(open("https://www.onthesnow.com/new-jersey/mountain-creek-resort/skireport.html"))
    report = self.new
    report.name = doc.css(".resort_name").text
    report.location = doc.css(".relatedRegions a").first.text
    report.status = doc.css(".current_status").text
    report.trails = doc.css("#resort_terrain p.open").first.text
    report.lifts = doc.css("#resort_terrain p.open")[1].text
    report.temp = doc.css(".temp").first.text
    report.new_snow = doc.css(".predicted_snowfall")[6].text
    report.parks = doc.css("#resort_terrain p.value")[3].text
    report.description = doc.css(".snow_report_comment_wrapper").text
    # binding.pry
      report
  end

  def self.scrape_jaypeak
    doc = Nokogiri::HTML(open("https://www.onthesnow.com/vermont/jay-peak/skireport.html"))
    report = self.new
    report.name = doc.css(".resort_name").text
    report.location = doc.css(".relatedRegions a").first.text
    report.status = doc.css(".current_status").text
    report.trails = doc.css("#resort_terrain p.open").first.text
    report.lifts = doc.css("#resort_terrain p.open")[1].text
    report.temp = doc.css(".temp").first.text
    report.new_snow = doc.css(".predicted_snowfall")[6].text
    report.parks = doc.css("#resort_terrain p.value")[3].text
    report.url = doc.css(".resort_name a").attr("href").value
    report.description = doc.css(".snow_report_comment_wrapper").text
    report
    # binding.pry
  end

  def self.scrape_stowe
    doc = Nokogiri::HTML(open("https://www.onthesnow.com/vermont/stowe-mountain-resort/skireport.html"))
    report = self.new
    report.name = doc.css(".resort_name").text
    report.location = doc.css(".relatedRegions a").first.text
    report.status = doc.css(".current_status").text
    report.trails = doc.css("#resort_terrain p.open").first.text
    report.lifts = doc.css("#resort_terrain p.open")[1].text
    report.temp = doc.css(".temp").first.text
    report.new_snow = doc.css(".predicted_snowfall")[6].text
    # parks = doc.css("#resort_terrain p.value")[3].text -- no parks at stowe
    report.description = doc.css(".snow_report_comment_wrapper").text
    report
    # binding.pry
  end

  def self.scrape_whiteface
    doc = Nokogiri::HTML(open("https://www.onthesnow.com/new-york/whiteface-mountain-resort/skireport.html"))
    report = self.new
    report.name = doc.css(".resort_name").text
    report.location = doc.css(".relatedRegions a").first.text
    report.status = doc.css(".current_status").text
    report.trails = doc.css("#resort_terrain p.open").first.text
    report.lifts = doc.css("#resort_terrain p.open")[1].text
    report.temp = doc.css(".temp").first.text
    report.new_snow = doc.css(".predicted_snowfall")[6].text
    report.parks = doc.css("#resort_terrain p.value")[3].text
    report.url = doc.css(".resort_name a").attr("href").value
    report.description = doc.css(".snow_report_comment_wrapper").text
    report
    # binding.pry
  end

  def self.scrape_belleayre
    doc = Nokogiri::HTML(open("https://www.onthesnow.com/new-york/belleayre/skireport.html"))
    report = self.new
    report.name = doc.css(".resort_name").text
    report.location = doc.css(".relatedRegions a").first.text
    report.status = doc.css(".current_status").text
    report.trails = doc.css("#resort_terrain p.open").first.text
    report.lifts = doc.css("#resort_terrain p.open")[1].text
    report.temp = doc.css(".temp").first.text
    report.new_snow = doc.css(".predicted_snowfall")[6].text
    report.parks = doc.css("#resort_terrain p.value")[3].text
    report.url = doc.css(".resort_name a").attr("href").value
    report.description = doc.css(".snow_report_comment_wrapper").text
    report
    # binding.pry
  end

  def self.scrape_windham
    doc = Nokogiri::HTML(open("https://www.onthesnow.com/new-york/windham-mountain/skireport.html"))
    report = self.new
    report.name = doc.css(".resort_name").text
    report.location = doc.css(".relatedRegions a").first.text
    report.status = doc.css(".current_status").text
    report.trails = doc.css("#resort_terrain p.open").first.text
    report.lifts = doc.css("#resort_terrain p.open")[1].text
    report.temp = doc.css(".temp").first.text
    report.new_snow = doc.css(".predicted_snowfall")[6].text
    report.parks = doc.css("#resort_terrain p.value")[3].text
    report.url = doc.css(".resort_name a").attr("href").value
    report.description = doc.css(".snow_report_comment_wrapper").text
    report
    # binding.pry
  end

  def self.scrape_bromley
    doc = Nokogiri::HTML(open("https://www.onthesnow.com/vermont/bromley-mountain/skireport.html"))
    report = self.new
    report.name = doc.css(".resort_name").text
    report.location = doc.css(".relatedRegions a").first.text
    report.status = doc.css(".current_status").text
    report.trails = doc.css("#resort_terrain p.open").first.text
    report.lifts = doc.css("#resort_terrain p.open")[1].text
    report.temp = doc.css(".temp").first.text
    report.new_snow = doc.css(".predicted_snowfall")[6].text
    report.parks = doc.css("#resort_terrain p.value")[3].text
    # report.url = doc.css(".resort_name a").attr("href").value
    report.description = doc.css(".snow_report_comment_wrapper").text
    report
    # binding.pry
  end

  def self.scrape_killington
    doc = Nokogiri::HTML(open("https://www.onthesnow.com/vermont/killington-resort/skireport.html"))
    report = self.new
    report.name = doc.css(".resort_name").text
    report.location = doc.css(".relatedRegions a").first.text
    report.status = doc.css(".current_status").text
    report.trails = doc.css("#resort_terrain p.open").first.text
    report.lifts = doc.css("#resort_terrain p.open")[1].text
    report.temp = doc.css(".temp").first.text
    report.new_snow = doc.css(".predicted_snowfall")[6].text
    report.parks = doc.css("#resort_terrain p.value")[4].text
    # report.url = doc.css(".resort_name a").attr("href").value
    report.description = doc.css(".snow_report_comment_wrapper").text
    report
    # binding.pry
  end

  def self.scrape_okemo
    doc = Nokogiri::HTML(open("https://www.onthesnow.com/vermont/okemo-mountain-resort/skireport.html"))
    report = self.new
    report.name = doc.css(".resort_name").text
    report.location = doc.css(".relatedRegions a").first.text
    report.status = doc.css(".current_status").text
    report.trails = doc.css("#resort_terrain p.open").first.text
    report.lifts = doc.css("#resort_terrain p.open")[1].text
    report.temp = doc.css(".temp").first.text
    report.new_snow = doc.css(".predicted_snowfall")[6].text
    report.parks = doc.css("#resort_terrain p.value")[4].text
    report.url = doc.css(".resort_name a").attr("href").value
    report.description = doc.css(".snow_report_comment_wrapper").text
    report
    # binding.pry
  end

  def self.scrape_sugarbush
    doc = Nokogiri::HTML(open("https://www.onthesnow.com/vermont/sugarbush/skireport.html"))
    report = self.new
    report.name = doc.css(".resort_name").text
    report.location = doc.css(".relatedRegions a").first.text
    report.status = doc.css(".current_status").text
    report.trails = doc.css("#resort_terrain p.open").first.text
    report.lifts = doc.css("#resort_terrain p.open")[1].text
    report.temp = doc.css(".temp").first.text
    report.new_snow = doc.css(".predicted_snowfall")[6].text
    report.parks = doc.css("#resort_terrain p.value")[4].text
    # report.url = doc.css(".resort_name a").attr("href").value
    report.description = doc.css(".snow_report_comment_wrapper").text
    report
    # binding.pry
  end

  def self.scrape_greekpeak
    doc = Nokogiri::HTML(open("https://www.onthesnow.com/new-york/greek-peak/skireport.html"))
    report = self.new
    report.name = doc.css(".resort_name").text
    report.location = doc.css(".relatedRegions a").first.text
    report.status = doc.css(".current_status").text
    report.trails = doc.css("#resort_terrain p.open").first.text
    report.lifts = doc.css("#resort_terrain p.open")[1].text
    report.temp = doc.css(".temp").first.text
    report.new_snow = doc.css(".predicted_snowfall")[6].text
    report.parks = doc.css("#resort_terrain p.value")[3].text
    report.url = doc.css(".resort_name a").attr("href").value
    report.description = doc.css(".snow_report_comment_wrapper").text
    report
    # binding.pry
  end

  def self.scrape_boreal
    doc = Nokogiri::HTML(open("https://www.onthesnow.com/california/boreal/skireport.html"))
    report = self.new
    report.name = doc.css(".resort_name").text
    report.location = doc.css(".relatedRegions a")[2].text
    report.status = doc.css(".current_status").text
    report.trails = doc.css("#resort_terrain p.open").first.text
    report.lifts = doc.css("#resort_terrain p.open")[1].text
    report.temp = doc.css(".temp").first.text
    report.new_snow = doc.css(".predicted_snowfall")[6].text
    report.parks = doc.css("#resort_terrain p.value")[3].text
    report.url = doc.css(".resort_name a").attr("href").value
    report.description = doc.css(".snow_report_comment_wrapper").text
    report
    # binding.pry
  end

  def self.scrape_mammoth
    doc = Nokogiri::HTML(open("https://www.onthesnow.com/california/mammoth-mountain-ski-area/skireport.html"))
    report = self.new
    report.name = doc.css(".resort_name").text
    report.location = doc.css(".relatedRegions a")[2].text
    report.status = doc.css(".current_status").text
    report.trails = doc.css("#resort_terrain p.open").first.text
    report.lifts = doc.css("#resort_terrain p.open")[1].text
    report.temp = doc.css(".temp").first.text
    report.new_snow = doc.css(".predicted_snowfall")[6].text
    report.parks = doc.css("#resort_terrain p.value")[3].text
    report.url = doc.css(".resort_name a").attr("href").value
    report.description = doc.css(".snow_report_comment_wrapper").text
    report
    # binding.pry
  end

  def self.scrape_sqauwvalley
    doc = Nokogiri::HTML(open("https://www.onthesnow.com/california/squaw-valley-usa/skireport.html"))
    report = self.new
    report.name = doc.css(".resort_name").text
    report.location = doc.css(".relatedRegions a")[2].text
    report.status = doc.css(".current_status").text
    report.trails = doc.css("#resort_terrain p.open").first.text
    report.lifts = doc.css("#resort_terrain p.open")[1].text
    report.temp = doc.css(".temp").first.text
    report.new_snow = doc.css(".predicted_snowfall")[6].text
    report.parks = doc.css("#resort_terrain p.value")[3].text
    report.url = doc.css(".resort_name a").attr("href").value
    report.description = doc.css(".snow_report_comment_wrapper").text
    report
    # binding.pry
  end

  def self.scrape_kirkwood
    doc = Nokogiri::HTML(open("https://www.onthesnow.com/california/kirkwood/skireport.html"))
    report = self.new
    report.name = doc.css(".resort_name").text
    report.location = doc.css(".relatedRegions a")[2].text
    report.status = doc.css(".current_status").text
    report.trails = doc.css("#resort_terrain p.open").first.text
    report.lifts = doc.css("#resort_terrain p.open")[1].text
    report.temp = doc.css(".temp").first.text
    report.new_snow = doc.css(".predicted_snowfall")[6].text
    report.parks = doc.css("#resort_terrain p.value")[3].text
    report.url = doc.css(".resort_name a").attr("href").value
    report.description = doc.css(".snow_report_comment_wrapper").text
    report
    # binding.pry
  end

  def self.scrape_northstar
    doc = Nokogiri::HTML(open("https://www.onthesnow.com/california/northstar-california/skireport.html"))
    report = self.new
    report.name = doc.css(".resort_name").text
    report.location = doc.css(".relatedRegions a")[2].text
    report.status = doc.css(".current_status").text
    report.trails = doc.css("#resort_terrain p.open").first.text
    report.lifts = doc.css("#resort_terrain p.open")[1].text
    report.temp = doc.css(".temp").first.text
    report.new_snow = doc.css(".predicted_snowfall")[6].text
    report.parks = doc.css("#resort_terrain p.value")[3].text
    report.url = doc.css(".resort_name a").attr("href").value
    report.description = doc.css(".snow_report_comment_wrapper").text
    report
    # binding.pry
  end

  def self.scrape_heavenly
    doc = Nokogiri::HTML(open("https://www.onthesnow.com/california/heavenly-mountain-resort/skireport.html"))
    report = self.new
    report.name = doc.css(".resort_name").text
    report.location = doc.css(".relatedRegions a")[2].text
    report.status = doc.css(".current_status").text
    report.trails = doc.css("#resort_terrain p.open").first.text
    report.lifts = doc.css("#resort_terrain p.open")[1].text
    report.temp = doc.css(".temp").first.text
    report.new_snow = doc.css(".predicted_snowfall")[6].text
    report.parks = doc.css("#resort_terrain p.value")[3].text
    report.url = doc.css(".resort_name a").attr("href").value
    report.description = doc.css(".snow_report_comment_wrapper").text
    report
    # binding.pry
  end

  def self.scrape_bear
    doc = Nokogiri::HTML(open("https://www.onthesnow.com/california/bear-mountain/skireport.html"))
    report = self.new
    report.name = doc.css(".resort_name").text
    report.location = doc.css(".relatedRegions a")[3].text
    report.status = doc.css(".current_status").text
    report.trails = doc.css("#resort_terrain p.open").first.text
    report.lifts = doc.css("#resort_terrain p.open")[1].text
    report.temp = doc.css(".temp").first.text
    report.new_snow = doc.css(".predicted_snowfall")[6].text
    report.parks = doc.css("#resort_terrain p.value")[3].text
    # report.url = doc.css(".resort_name a").attr("href").value
    report.description = doc.css(".snow_report_comment_wrapper").text
    report
    # binding.pry
  end

  def self.scrape_loon
    doc = Nokogiri::HTML(open("https://www.onthesnow.com/new-hampshire/loon-mountain/skireport.html"))
    report = self.new
    report.name = doc.css(".resort_name").text
    report.location = doc.css(".relatedRegions a").first.text
    report.status = doc.css(".current_status").text
    report.trails = doc.css("#resort_terrain p.open").first.text
    report.lifts = doc.css("#resort_terrain p.open")[1].text
    report.temp = doc.css(".temp").first.text
    report.new_snow = doc.css(".predicted_snowfall")[6].text
    report.parks = doc.css("#resort_terrain p.value")[3].text
    # report.url = doc.css(".resort_name a").attr("href").value
    report.description = doc.css(".snow_report_comment_wrapper").text
    report
    # binding.pry
  end

  def self.scrape_attitash
    doc = Nokogiri::HTML(open("https://www.onthesnow.com/new-hampshire/attitash/skireport.html"))
    report = self.new
    report.name = doc.css(".resort_name").text
    report.location = doc.css(".relatedRegions a").first.text
    report.status = doc.css(".current_status").text
    report.trails = doc.css("#resort_terrain p.open").first.text
    report.lifts = doc.css("#resort_terrain p.open")[1].text
    report.temp = doc.css(".temp").first.text
    report.new_snow = doc.css(".predicted_snowfall")[6].text
    report.parks = doc.css("#resort_terrain p.value")[3].text
    report.url = doc.css(".resort_name a").attr("href").value
    report.description = doc.css(".snow_report_comment_wrapper").text
    report
    # binding.pry
  end

  def self.scrape_bigsky
    doc = Nokogiri::HTML(open("https://www.onthesnow.com/montana/big-sky-resort/skireport.html"))
    report = self.new
    report.name = doc.css(".resort_name").text
    report.location = doc.css(".relatedRegions a").first.text
    report.status = doc.css(".current_status").text
    report.trails = doc.css("#resort_terrain p.open").first.text
    report.lifts = doc.css("#resort_terrain p.open")[1].text
    report.temp = doc.css(".temp").first.text
    report.new_snow = doc.css(".predicted_snowfall")[6].text
    report.parks = doc.css("#resort_terrain p.value")[3].text
    report.url = doc.css(".resort_name a").attr("href").value
    report.description = doc.css(".snow_report_comment_wrapper").text
    report
    # binding.pry
  end

  def self.scrape_whitefish
    doc = Nokogiri::HTML(open("https://www.onthesnow.com/montana/whitefish-mountain-resort/skireport.html"))
    report = self.new
    report.name = doc.css(".resort_name").text
    report.location = doc.css(".relatedRegions a").first.text
    report.status = doc.css(".current_status").text
    report.trails = doc.css("#resort_terrain p.open").first.text
    report.lifts = doc.css("#resort_terrain p.open")[1].text
    report.temp = doc.css(".temp").first.text
    report.new_snow = doc.css(".predicted_snowfall")[6].text
    report.parks = doc.css("#resort_terrain p.value")[3].text
    report.url = doc.css(".resort_name a").attr("href").value
    report.description = doc.css(".snow_report_comment_wrapper").text
    report
    # binding.pry
  end

  def self.scrape_eaglecrest
    doc = Nokogiri::HTML(open("https://www.onthesnow.com/alaska/eaglecrest-ski-area/skireport.html"))
    report = self.new
    report.name = doc.css(".resort_name").text
    report.location = doc.css(".relatedRegions a").first.text
    report.status = doc.css(".current_status").text
    report.trails = doc.css("#resort_terrain p.open").first.text
    report.lifts = doc.css("#resort_terrain p.open")[1].text
    report.temp = doc.css(".temp").first.text
    report.new_snow = doc.css(".predicted_snowfall")[6].text
    report.parks = doc.css("#resort_terrain p.value")[3].text
    # report.url = doc.css(".resort_name a").attr("href").value
    report.description = doc.css(".snow_report_comment_wrapper").text
    report
    # binding.pry
  end

  def self.scrape_camelback
    doc = Nokogiri::HTML(open("https://www.onthesnow.com/pennsylvania/camelback-mountain-resort/skireport.html"))
    report = self.new
    report.name = doc.css(".resort_name").text
    report.location = doc.css(".relatedRegions a").first.text
    report.status = doc.css(".current_status").text
    report.trails = doc.css("#resort_terrain p.open").first.text
    report.lifts = doc.css("#resort_terrain p.open")[1].text
    report.temp = doc.css(".temp").first.text
    report.new_snow = doc.css(".predicted_snowfall")[6].text
    report.parks = doc.css("#resort_terrain p.value")[3].text
    # report.url = doc.css(".resort_name a").attr("href").value
    report.description = doc.css(".snow_report_comment_wrapper").text
    report
    # binding.pry
  end

  def self.scrape_sevensprings
    doc = Nokogiri::HTML(open("https://www.onthesnow.com/pennsylvania/seven-springs/skireport.html"))
    report = self.new
    report.name = doc.css(".resort_name").text
    report.location = doc.css(".relatedRegions a").first.text
    report.status = doc.css(".current_status").text
    report.trails = doc.css("#resort_terrain p.open").first.text
    report.lifts = doc.css("#resort_terrain p.open")[1].text
    report.temp = doc.css(".temp").first.text
    report.new_snow = doc.css(".predicted_snowfall")[6].text
    report.parks = doc.css("#resort_terrain p.value")[3].text
    # report.url = doc.css(".resort_name a").attr("href").value
    report.description = doc.css(".snow_report_comment_wrapper").text
    report
    # binding.pry
  end

  def self.scrape_bigboulder
    doc = Nokogiri::HTML(open("https://www.onthesnow.com/pennsylvania/big-boulder/skireport.html"))
    report = self.new
    report.name = doc.css(".resort_name").text
    report.location = doc.css(".relatedRegions a").first.text
    report.status = doc.css(".current_status").text
    report.trails = doc.css("#resort_terrain p.open").first.text
    report.lifts = doc.css("#resort_terrain p.open")[1].text
    report.temp = doc.css(".temp").first.text
    report.new_snow = doc.css(".predicted_snowfall")[6].text
    report.parks = doc.css("#resort_terrain p.value")[3].text
    # report.url = doc.css(".resort_name a").attr("href").value
    report.description = doc.css(".snow_report_comment_wrapper").text
    report
    # binding.pry
  end

  def self.scrape_gore
    doc = Nokogiri::HTML(open("https://www.onthesnow.com/new-york/gore-mountain/skireport.html"))
    report = self.new
    report.name = doc.css(".resort_name").text
    report.location = doc.css(".relatedRegions a").first.text
    report.status = doc.css(".current_status").text
    report.trails = doc.css("#resort_terrain p.open").first.text
    report.lifts = doc.css("#resort_terrain p.open")[1].text
    report.temp = doc.css(".temp").first.text
    report.new_snow = doc.css(".predicted_snowfall")[6].text
    report.parks = doc.css("#resort_terrain p.value")[3].text
    # report.url = doc.css(".resort_name a").attr("href").value
    report.description = doc.css(".snow_report_comment_wrapper").text
    report
    # binding.pry
  end





end
