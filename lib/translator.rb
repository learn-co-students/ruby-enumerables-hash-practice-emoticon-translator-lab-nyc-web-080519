require 'yaml'

def load_library(library)
  file = YAML.load_file(library)
  
  my_hash = {}
  get_meaning_hash = {}
  get_emoticon_hash = {}
  
  file.each_pair do |key,value|
    temp1 = { value[1] => key }
    temp2 = { value[0] => value[1] }
    get_meaning_hash.merge!(temp1)
    get_emoticon_hash.merge!(temp2)
  end
  
  #puts get_meaning_hash
  #puts get_emoticon_hash

  
  my_hash = {
    :get_meaning => get_meaning_hash,
    :get_emoticon => get_emoticon_hash
  }
  return my_hash
end

def get_japanese_emoticon(library, emoticon)
  my_library = load_library(library)
  if my_library[:get_emoticon][emoticon]
    return my_library[:get_emoticon][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(library, emoticon)
  my_library = load_library(library)
  if my_library[:get_meaning][emoticon]
    return my_library[:get_meaning][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end