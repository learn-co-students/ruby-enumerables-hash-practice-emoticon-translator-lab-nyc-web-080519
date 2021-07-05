
require "yaml"
require 'pry'



def load_library(file_path)
 emoticons = YAML.load_file(file_path)
 result = {
   "get_meaning" => {},
   "get_emoticon" => {}
 }
 
   emoticons.each do |key, value|
     result["get_emoticon"][value[0]] = emoticons[key][1]
     result["get_meaning"][value[1]] = key
     #binding.pry
   end
   result
end

def get_japanese_emoticon(file_path, emoticon) 
  emo_lib = load_library(file_path)["get_emoticon"][emoticon]
  emo_lib ? emo_lib : "Sorry, that emoticon was not found"
  #binding.pry
end

def get_english_meaning(file_path, emoticon)
  emo_lib = load_library(file_path)["get_meaning"][emoticon]
  emo_lib ? emo_lib : "Sorry, that emoticon was not found"
end