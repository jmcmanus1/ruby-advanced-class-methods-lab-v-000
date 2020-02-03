require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create
    c = self.new
    c.save
    c
  end

  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    song.save
    song
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.find_by_name(song_name)
    all.detect{|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    all.each do |song|
      if song_name == song.name
        song_name
      else
        self.create_by_name(song_name)
      end
    end
  end
end
