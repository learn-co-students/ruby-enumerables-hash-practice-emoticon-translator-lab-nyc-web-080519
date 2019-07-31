
require "yaml"
require 'pry'



def load_library(file_path)
 emoticons = YAML.load_file(file_path)
 result = {
   :get_meaning => {},
   :get_emoticon => {}
 }
 
   emoticons.each do |key, value|
     result[:get_emoticon][value[0]] = get_emoticon
     result[:get_meaning][value[1]] = key
     binding.pry
   end
end
