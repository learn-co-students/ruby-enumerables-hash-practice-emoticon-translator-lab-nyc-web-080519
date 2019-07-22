require "yaml"

def load_library(file_path)
  emoticons = YAML.load_file(file_path)
  
  result = {
    'get_meaning' => {},
    'get_emoticon' => {}
  }

  emoticons.each do |key,value|
    result['get_emoticon'][value[0]] = emoticons[key][1]
    result['get_meaning'][value[1]] = key
  end

  result
  
end

def get_japanese_emoticon(file_path, emoticon)
  result = load_library(file_path)['get_emoticon'][emoticon]
  if result
    return result
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticon)
  result = load_library(file_path)['get_meaning'][emoticon]
  if result
    return result
  else
    "Sorry, that emoticon was not found"
  end
end