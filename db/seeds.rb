require "csv"

Game.delete_all
Publisher.delete_all
Platform.delete_all
Page.delete_all

# Adding the file path of the csv file
csvfile = Rails.root.join("db/vgsales.csv")

#puts "Loading Games from the CSV file: #{csvfile}"

csv_data = File.read(csvfile)
games = CSV.parse(csv_data, headers: true, encoding: "utf-8")

games.each do |g|
  publisher = Publisher.find_or_create_by(name: g["Publisher"])
  platform = Platform.find_or_create_by(name: g["Platform"])

  if publisher && publisher.valid? && platform && platform.valid?
    game = publisher.games.create(
      rank: g["Rank"],
      name: g["Name"],
      year: g["Year"],
      platform_id: platform["id"],
      NA_sales: g["NA_Sales"],
      EU_sales: g["EU_Sales"],
      JP_sales: g["JP_Sales"],
      other_sales: g["Other_Sales"],
      Global_sales: g["Global_Sales"]
    )
    puts "invalid game #{g["Name"]}" unless game&.valid?
  else
    puts "invalid publisher #{g["Publisher"]} for game #{g['Name']}."
  end
end

Page.create(
  title: "About the Data",
  content: "The data sources powering this website was provided by Kaggle.",
  permalink: "about"
)
Page.create(
  title: "Contact Me",
  content: "If you like this website and would lile to reach out, please email me at owenbai@hotmail.com"
  permalink: "contact me"
)
puts "Created #{Publisher.count} Publishers."
puts "Created #{Platform.count} Platforms."
puts "Created #{Game.count} Games."

