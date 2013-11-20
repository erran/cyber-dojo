#!/usr/bin/env ruby

class Door
  attr_accessor :closed

  def closed?
    !!@closed
  end

  def open?
    !closed?
  end
end

@doors = []

num = ARGV.first.nil? ? 100 : ARGV.first.to_i
num.times do
  @doors << Door.new
end

arr = 1.upto(@doors.count).to_a
arr.each do |n|
  @doors.each_with_index do |door, i|
    # Start from one 1 for indices
    i += 1

    if n % i == 0
      door.closed = !door.closed?
    end
  end
end

@doors = @doors.each_with_index.map do |door, i|
  {
    door: door,
    index: i
  }
end

open_doors = @doors.find_all { |hash|
  hash[:door].open?
}.map { |hash| hash[:index] }

closed_doors = @doors.find_all { |hash|
  hash[:door].closed?
}.map { |hash| hash[:index] }

puts "Open doors: #{open_doors}"
puts "Closed doors: #{closed_doors}"
