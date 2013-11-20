#!/usr/bin/env ruby

word = ARGV.first
puts word.chars.permutation.map(&:join).uniq
