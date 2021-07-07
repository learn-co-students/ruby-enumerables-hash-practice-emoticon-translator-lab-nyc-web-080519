require "yaml"


def load_library(path)
  emo = YAML.load_file(path)
  emo_hash = {}
    emo_hash["get_emoticon"] = Hash.new
  emo_hash["get_meaning"] = Hash.new

  emo.each do |english_word, emoticon_set|
    emo_hash["get_emoticon"][emoticon_set.first] = emoticon_set.last
    emo_hash["get_meaning"][emoticon_set.last] = english_word
  end
  emo_hash
end

def get_japanese_emoticon(path, emoji)
  emo_hash = load_library(path)
  result = emo_hash["get_emoticon"][emoji]
  if result == nil
    result = "Sorry, that emoticon was not found" 
  end
  result

  
end



def get_english_meaning(path, emoji)
  emo_hash = load_library(path)
  result = emo_hash["get_meaning"][emoji]
  if result == nil
    result = "Sorry, that emoticon was not found" 
  end
  return result
end
