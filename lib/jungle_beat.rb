require_relative 'linked_list'
require_relative 'node'
require 'pry'
class JungleBeat
attr_accessor :beats, :rate, :voice
attr_reader :linked_list, :value

  def initialize(beats)
    @beats = beats
    @rate = 500
    @voice = "Boing"
  split_beats = beats.split
  first_beat = split_beats[0]
  @linked_list = LinkedList.new(first_beat)
  split_beats[1..-1].each do |beat|
    @linked_list.append(beat)
    end
  end

  def play
    `say -r #{@rate} -v #{@voice} #{beats}`
  end

  def append(beats)
    linked_list.append(beats)
    split_beats = beats.split
    split_beats[1..-1].each do |beat|
      @linked_list.append(beat)
    end
  end

  def prepend(beats)
    linked_list.prepend(beats)
    split_beats = beats.split
    split_beats[1..-1].each do |beat|
      @linked_list.prepend(beat)
    end
  end

  def all
    linked_list.all
  end

  def count
    linked_list.count
  end

  def pop(n = 1)
    linked_list.pop(n)
  end

  def insert(position, n)
    linked_list.insert(position, n)
  end

  def find(position, n)
    linked_list.find(position, n)
  end

  def include?(value)
    linked_list.include?(value)
  end

end
