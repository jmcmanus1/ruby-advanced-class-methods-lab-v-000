require 'pry'

class Song
  attr_accessor :name, :artist
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
    if find_by_name(song_name) == nil
      create_by_name(song_name)
    else find_by_name(song_name)
    end
  end

  def self.alphabetical
    all.sort_by {|obj| obj.name}
  end

  def self.new_from_filename(filename)
    song_name = filename.split(" - ")[1].chomp(".mp3")
    artist_name = filename.split(" - ")[0]
    song = self.new
    song.name = song_name
    song.artist = artist_name
    song.save
    song
  end
end
