# Write a program that outputs the lyrics for "Ninety-nine Bottles of Beer on the Wall"
# Your program should print the number of bottles in English, not as a number. For example:
#
# Ninety-nine bottles of beer on the wall,
# Ninety-nine bottles of beer,
# Take one down, pass it around,
# Ninety-eight bottles of beer on the wall.
# ...
# One bottle of beer on the wall,
# One bottle of beer,
# Take one down, pass it around,
# Zero bottles of beer on the wall.
#
# Your program should not use ninety-nine output statements!
# Design your program with a class named BeerSong whose initialize method
# receives a parameter indicating the number of bottles of beer initially on the wall.
# If the parameter is less than zero, set the number of bottles to zero. Similarly,
# if the parameter is greater than 99, set the number of beer bottles to 99
# Then make a public method called print_song that outputs all stanzas from the number of bottles of beer down to zero.
# Add any additional methods you find helpful.

class BeerSong
  def initialize(beers)
    if beers < 0
      @beers = 0
    elsif beers > 99
      @beers = 99
    else
      @beers = beers
    end
  end

  def print_song
    @beers.downto 1 do |x|
      stanza x
    end
  end

  def stanza(x)
    if x == 0
      String.new
    else
      puts "#{english x} #{bottles x} of beer on the wall,",
           "#{english x} #{bottles x} of beer,",
           "Take one down, pass it around,",
           "#{english x - 1} #{bottles x - 1} of beer on the wall."
    end
  end

  def bottles(x)
    if x == 1
      "bottle"
    else
      "bottles"
    end
  end

  def english(x)
    if 0 <= x && x <= 19
      to_twenty = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"]
      in_english = to_twenty[x]
    elsif x % 10 == 0
      tens = ["zero", "ten", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"]
      in_english = tens[x / 10]
    else
      in_english = "#{english x/10*10}-#{english x%10}"
    end
    in_english.capitalize
  end
end
