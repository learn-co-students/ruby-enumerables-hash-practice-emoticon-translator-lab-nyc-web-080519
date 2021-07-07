# require modules here
require "yaml"

def load_library(file_path)
  emoticons = YAML.load_file(file_path)
  new_hash = {"get_meaning" => Hash.new,
              "get_emoticon" => Hash.new
  }
  
  emoticons.each do |key, value|
    new_hash["get_meaning"][value[1]] = key
    new_hash["get_emoticon"][value[0]] = value[1]
  end
  new_hash
end

def get_japanese_emoticon(file_path, emoticon)
  jap_emoji = ""
  new_hash = load_library(file_path)
  
  new_hash["get_emoticon"].each do |key, value|
    if key == emoticon 
      jap_emoji = value
    end
  end
  
  new_hash["get_meaning"].each do |key, value|
    if key == jap_emoji
      return key
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
  new_hash = load_library(file_path)
  
  new_hash["get_meaning"].each do |key, value|
    if key == emoticon 
      return value
    end
  end
  return "Sorry, that emoticon was not found"
end




