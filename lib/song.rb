
require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    #@@all << song
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
#can we call instance method (save) from class method
#yes we can but only it this case
#where you create new instance of a class and on that instance you call instance method
  def self.create_by_name(name)
    song = Song.new
    song.name = name
    #@@all << song
    song.save
    song
  end
#mistake here was a single "="!!!!!
  def self.find_by_name(name)
    @@all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    create_by_name(name)
    find_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(filename)
    song = self.new
    #binding.pry
    song.artist_name = filename.split(/\s-\s|\./)[0]
    song.name = filename.split(/\s-\s|\./)[1]
    song
  end
#can we do this one using other class method?
  def self.create_from_filename(filename)
    song = self.new
    song.artist_name = filename.split(/\s-\s|\./)[0]
    song.name = filename.split(/\s-\s|\./)[1]
    song.save
  end

  def self.destroy_all
    self.all.clear
  end

end

# pesma = Song.new
# Song.new_from_filename("Taylor Swift - Blank Space.mp3")


# 1) Song Class Methods .new_from_filename initializes a song and artist_name based on the filename format
# Failure/Error: expect(song.name).to eq("For Love I Come")

# NoMethodError:
#   undefined method `name' for #<Array:0x00007fd995d0fc20>
# # ./spec/song_class_methods_spec.rb:82:in `block (3 levels) in <top (required)>'

# Finished in 0.00992 seconds (files took 0.15462 seconds to load)
# 10 examples, 1 failure
