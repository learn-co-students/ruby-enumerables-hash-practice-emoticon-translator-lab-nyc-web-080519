# require modules here
require "yaml"

def load_library(file_name)
  # code goes here
  library = YAML.load_file(file_name)
  translator = {"get_meaning" => {}, "get_emoticon" => {}}
  library.each{ |meaning, emotes|
    translator["get_meaning"][emotes[1]] = meaning
    translator["get_emoticon"][emotes[0]] = emotes[1]
  }
  translator
end

def get_japanese_emoticon(file_name, emoticon)
  # code goes here
  translator = load_library(file_name)
  if !translator["get_emoticon"][emoticon].nil?
    translator["get_emoticon"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_name, emoticon)
  # code goes here
  translator = load_library(file_name)
  if !translator["get_meaning"][emoticon].nil?
    translator["get_meaning"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end