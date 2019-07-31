
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
  emo_lib = load_library(file_path)
end

def get_english_meaning
  # code goes here
end