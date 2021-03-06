 require_relative '../config/environment'

def list_methods
  puts <<-STRING
  What would you like to do?
------------------------------------------------
* Add new artist - 'add artist'
* Populate playlist - 'populate playlist'
* Show playlists - 'show playlist'
* Find artist - 'find artist'
* Find album - 'find album'
* Find song - 'find song'
* Get most popular artist - 'most popular artist'
* Get artist with most albums - 'most albums artist'
* Display all artists - 'all artists'
* Display all songs - 'all artist songs'
* Display all albums - 'all artist albums'
------------------------------------------------
  STRING
end

while true
  puts "Enter help if you wish to view menu, otherwise enter a command"
  input = gets.chomp
  if input == 'add artist'
    puts "Enter an Artist name: "
    artist = Method.gets_user_input
    # binding.pry
    fan_count = Method.find_num_fans(artist)
    # binding.pry
    album_count = Method.find_num_albums(artist)
    # binding.pry
    if !Artist.exists?(name: artist)
      artist_instance = Artist.create_artist(artist, album_count, fan_count)
    else
        puts "Artist is already in table."
    end
  elsif input == 'make playlist'
    puts "Enter a playlist name: "
    name = gets.chomp
    puts "Enter the artist name: "
    artist = gets.chomp
    puts "Enter a song name: "
    song = gets.chomp

    artist_id = Playlist.get_artist_id(artist)
    song_id = Playlist.get_song_id(song)

    if artist_id && song_id
      Playlist.create_playlist(name, artist_id, song_id)
    end
  elsif input == 'find artist'
    puts "Enter the artist name: "
    name = gets.chomp
    name = Method.input(name)
    artist = Artist.find_by(name: name)
  elsif input == 'find album'
    puts "Enter the album name: "
    name = gets.chomp
    name = Method.input(name)
    p album = Album.find_by(name: name)
  elsif input == 'find song'
    puts "Enter the song name: "
    name = gets.chomp
    name = Method.input(name)
    song = Song.find_by(name: name)
  elsif input == 'most popular'
    Artist.most_popular
  elsif input == 'most albums'
    Artist.most_albums
  elsif input == 'all artist songs'
    puts "Enter an artist"
    input = gets.chomp
    puts Song.all_songs(input)
  elsif input == 'all artists'
    puts Artist.all_artists
  elsif input == 'all artist albums'
      puts "Enter an artist"
      input = gets.chomp
     puts Album.all_albums(input)
   elsif input == 'show playlist'
     puts "Enter a playlist name"
     input = gets.chomp
     puts Playlist.show_playlist(input)
   elsif input == "help"
     list_methods
   elsif input == "exit"
     break
   else
     puts "Invalid command."
  end

  end
