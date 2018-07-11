require 'bundler'
require "rest-client"
require 'json'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'
# require_relative 'model/album.rb'
# require_relative 'model/song.rb'
# require_relative 'model/artist.rb'
require_all 'model'
