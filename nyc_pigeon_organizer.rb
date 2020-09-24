require 'pry'

def nyc_pigeon_organizer(data)
  merge_arrays(data)
  push_pigeon_color(data)
  push_pigeon_gender(data)
  push_pigeon_lives(data)
  @pigeon_hash
end


def collect_names(data)
  colors = data.values[0].values
  @names = colors.flatten!.uniq
end


def collect_keys(data)
  @generic_keys = data.keys
  @specific_colors = data.values[0].keys 
  @specific_genders = data.values[1].keys
  @specific_lives = data.values[2].keys
end


def insert_to_hash(data)
  collect_keys(data)
  merge_arrays(data)
  test = data.key("Theo")

  # binding.pry
end


def merge_arrays(data)
  collect_names(data)
  collect_keys(data)

  name_array = @names.each_slice(1).map {|key, value| [key, value]}

  @pigeon_hash = Hash[name_array.map {|key, value| [key, value]}]

  @names.each do |key|
    @pigeon_hash[key] = Hash[@generic_keys.map {|key, value| [key, value = []]}]
  end
end


def push_pigeon_color(data)
  color_keys = data[:color].keys

  color_keys.each do |key|
    @names.each do |name|
      if data.dig(:color, key).include?(name)
        @pigeon_hash[name][:color].push(key.to_s)
      end
    end
  end
end



def push_pigeon_gender(data)
  gender_keys = data[:gender].keys

  gender_keys.each do |key|
    @names.each do |name|
      if data.dig(:gender, key).include?(name)
        @pigeon_hash[name][:gender].push(key.to_s)
      end
    end
  end 
end


def push_pigeon_lives(data)
  lives_keys = data[:lives].keys

  lives_keys.each do |key|
    @names.each do |name|
      if data.dig(:lives, key).include?(name)
        @pigeon_hash[name][:lives].push(key.to_s)
      end
    end
  end 
end
