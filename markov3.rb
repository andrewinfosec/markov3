#!/usr/bin/env ruby -w
#
# Markov chain algorithm with three-word phrases

opt_infinite = ARGV.delete('-i') ? true : false

array = []
hash  = {}

# Process input from stdin
#
ARGF.each {|line| array += line.split}

# Establish data structure
#
(0..(array.length - 3)).each do |index|
  key = [array[index], array[index + 1]]
  value = array[index + 2]

  if hash.has_key?(key)
    hash[key].push(value)
  else
    hash[key] = [value]
  end
end

# Print output using Markov algorithm
#
word1,word2 = array[0..1]
print word1 + ' ' + word2

count = 0
loop do
  break if not hash[[word1, word2]]

  word3 = hash[[word1, word2]].sample
  print ' ' + word3
  word1 = word2
  word2 = word3
  
  count += 1
  break if count >= 98 and opt_infinite == false # 100 total words of output
end

print "\n"; $stdout.flush # For earlier use of print
