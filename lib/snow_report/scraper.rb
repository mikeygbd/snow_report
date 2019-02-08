class Scraper
URLS = ["https://www.onthesnow.com/vermont/mount-snow/skireport.html", "https://www.onthesnow.com/vermont/stratton-mountain/skireport.html", "https://www.onthesnow.com/new-york/hunter-mountain/skireport.html", "https://www.onthesnow.com/new-jersey/mountain-creek-resort/skireport.html", "https://www.onthesnow.com/vermont/jay-peak/skireport.html", "https://www.onthesnow.com/new-york/whiteface-mountain-resort/skireport.html", "https://www.onthesnow.com/new-york/belleayre/skireport.html", "https://www.onthesnow.com/new-york/windham-mountain/skireport.html", "https://www.onthesnow.com/vermont/bromley-mountain/skireport.html", "https://www.onthesnow.com/vermont/killington-resort/skireport.html", "https://www.onthesnow.com/vermont/okemo-mountain-resort/skireport.html", "https://www.onthesnow.com/vermont/sugarbush/skireport.html", "https://www.onthesnow.com/new-york/greek-peak/skireport.html", "https://www.onthesnow.com/new-hampshire/loon-mountain/skireport.html", "https://www.onthesnow.com/new-hampshire/attitash/skireport.html", "https://www.onthesnow.com/montana/big-sky-resort/skireport.html", "https://www.onthesnow.com/montana/whitefish-mountain-resort/skireport.html", "https://www.onthesnow.com/alaska/eaglecrest-ski-area/skireport.html", "https://www.onthesnow.com/pennsylvania/camelback-mountain-resort/skireport.html", "https://www.onthesnow.com/pennsylvania/seven-springs/skireport.html", "https://www.onthesnow.com/pennsylvania/big-boulder/skireport.html",  "https://www.onthesnow.com/new-york/gore-mountain/skireport.html", "https://www.onthesnow.com/california/boreal/skireport.html", "https://www.onthesnow.com/california/mammoth-mountain-ski-area/skireport.html", "https://www.onthesnow.com/california/squaw-valley-usa/skireport.html", "https://www.onthesnow.com/california/kirkwood/skireport.html", "https://www.onthesnow.com/california/northstar-california/skireport.html", "https://www.onthesnow.com/california/heavenly-mountain-resort/skireport.html", "https://www.onthesnow.com/california/bear-mountain/skireport.html"   ]
STATES = ["Alaska", "California", "Montana", "New Hampshire", "New Jersey", "New York", "Pennsylvania", "Vermont"]
attr_accessor :name, :temp, :lifts, :trails, :new_snow, :parks, :status, :description, :location


  def self.today
  self.scrape_reports
  end

  def self.states
    STATES
  end

  def self.scrape_reports
    URLS.map do |url|
       self.scrape(url)
        # binding.pry
    end
    # hash
    # Report.new_from_scraper(hash)
  end

  def self.scrape(url)
    doc = Nokogiri::HTML(open(url))
    report = self.new
    report.name = doc.css(".resort_name").text
    # report = Report.new(name)
    report.status = doc.css(".current_status").text
    report.trails = doc.css("#resort_terrain p.open").first.text
    report.lifts = doc.css("#resort_terrain p.open")[1].text
    report.temp = doc.css(".temp").first.text
    report.new_snow = doc.css(".predicted_snowfall")[6].text
    report.parks = doc.css("#resort_terrain p.value")[3].text
    report.description = doc.css(".snow_report_comment_wrapper").text
    report.location = ''
    doc.css(".relatedRegions a").each do |location|
      if STATES.include?(location.text)
        report.location = location.text
        # binding.pry
      end
    end
    report
  end
end
