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
    @@all << song 
    return song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    return song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    return song
  end

  def self.find_by_name(song_name)

    @@all.find do |song|
      if song.name == song_name
        return song 
      end
    end
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    return @@all.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)
    song_info = filename.split(" - ")
    artist = song_info[0]
    song_name = song_info[1].delete_suffix(".mp3")
    
    song = self.new
    song.name = song_name
    song.artist_name = artist

    return song
  end

  def self.create_from_filename(filename)
    song_info = filename.split(" - ")
    artist = song_info[0]
    song_name = song_info[1].delete_suffix(".mp3")
    
    song = self.new
    song.name = song_name
    song.artist_name = artist

    @@all << song
  end



  def self.destroy_all
    @@all.clear
  end

end
