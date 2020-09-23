require 'pry'
@pigeon_names = []
@pigeon_classifications = []
@starter_keys = nil
@pigeon_hash = Hash.new

def nyc_pigeon_organizer(data)
  pigeon_values(data)
  pigeon_keys(data)
  @pigeon_hash = Hash[@pigeon_names.map {|key, value| [key, value]}]
  binding.pry
end


def pigeon_keys(data)
  @starter_keys = data.keys
  color_keys = data[:color].keys
  gender_keys = data[:gender].keys
  lives_keys = data[:lives].keys
  @pigeon_classifications = color_keys + gender_keys + lives_keys
end


def pigeon_values(data)
  first_values = data.values
  second_values = []
  first_values.each do |pigeon|
    second_values.push(pigeon.values)
  end
  @pigeon_names = second_values.flatten.uniq
end


pigeon_color(data)
  
end


test_data = {
        :color => {
          :purple => ["Theo", "Peter Jr.", "Lucky"],
          :grey => ["Theo", "Peter Jr.", "Ms. K"],
          :white => ["Queenie", "Andrew", "Ms. K", "Alex"],
          :brown => ["Queenie", "Alex"]
        },
        :gender => {
          :male => ["Alex", "Theo", "Peter Jr.", "Andrew", "Lucky"],
          :female => ["Queenie", "Ms. K"]
        },
        :lives => {
          "Subway" => ["Theo", "Queenie"],
          "Central Park" => ["Alex", "Ms. K", "Lucky"],
          "Library" => ["Peter Jr."],
          "City Hall" => ["Andrew"]
        }
}

nyc_pigeon_organizer(test_data)