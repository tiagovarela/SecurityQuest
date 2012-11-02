#!/usr/bin/env ruby

alpha="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 "

def print_usage
  puts "Usage:"
  puts "  #{$0} SHIFT TEXT"
  puts "Description:"
  puts "  This application ciphers text using a simple Caesar cipher."
  puts "  SHIFT is an integer which is used to increment or decrement"
  puts "  the TEXT, allowing ciphering and deciphering."
  puts "  The method used by this program works only with letters and"
  puts "  numbers."
  puts "Example:"
  puts "  #{$0} 1 'Linux'"
  puts "  Mjovy"
  puts "  #{$0} -1 'Mjovy'"
  puts "  Linux"
end

if ARGV.length == 2
  shift = ARGV[0]
  text = ARGV[1]
  if shift =~ /^[+-]?[0-9]+$/ and text =~ /^[a-z0-9\s]*$/i
    text.each_char do |c|
      i = alpha.index(c)
      i = (i + shift.to_i) % alpha.length
      print alpha[i]
    end
    print "\n"
  else
    print_usage
  end
else
  print_usage
end