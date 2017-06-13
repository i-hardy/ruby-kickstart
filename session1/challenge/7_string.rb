# given a string, return the character after every letter "r"
#
# pirates_say_arrrrrrrrr("are you really learning Ruby?") # => "eenu"
# pirates_say_arrrrrrrrr("Katy Perry is on the radio!")   # => "rya"
# pirates_say_arrrrrrrrr("Pirates say arrrrrrrrr")        # => "arrrrrrrr"

def pirates_say_arrrrrrrrr(string)
  pirates = ""
  string = string.downcase
  add_char = false
  string.split(//).each do |rcheck|
    if rcheck != "r"
      pirates << rcheck if add_char
      add_char = false
    else
      pirates << rcheck if add_char
      add_char = true
    end
  end
  pirates
end
