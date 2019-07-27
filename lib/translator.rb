# require modules here
require "yaml"

def load_library(file)
  # code goes here
  newEmoticons = {:get_meaning => {}, :get_emoticon => {}}
  emoticons = YAML.load_file(file)
  emoticons.each do |meaning, symbols|
    englishEmoticon = symbols[0]
    japaneseEmoticon = symbols[1]
    newEmoticons[:get_meaning][japaneseEmoticon] = meaning
    newEmoticons[:get_emoticon][englishEmoticon] = japaneseEmoticon
  end
  newEmoticons
end

def get_japanese_emoticon(file, emoticon)
  # code goes here
  emoticonHash = load_library(file)
  emoticonHash[:get_emoticon][emoticon] ? emoticonHash[:get_emoticon][emoticon] : "Sorry, that emoticon was not found"
end

def get_english_meaning(file, emoticon)
  # code goes here
  emoticonHash = load_library(file)
  emoticonHash[:get_meaning][emoticon] ? emoticonHash[:get_meaning][emoticon] : "Sorry, that emoticon was not found"
end
