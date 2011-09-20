ROOT_DIR = File.expand_path(File.dirname(__FILE__)) unless defined? ROOT_DIR

require "rubygems"
require 'digest/sha2'

begin
  require File.expand_path("vendor/dependencies/lib/dependencies", File.dirname(__FILE__))
rescue LoadError
  require "dependencies"
end

require "bundler/setup"
Bundler.require :default

require "monk/glue"

class Main < Monk::Glue
  set :app_file, __FILE__
  use Rack::Session::Cookie  
end

set :markdown, :layout_engine => :slim
set :slim, :auto_escape => false
# Connect to redis database.
Ohm.connect(monk_settings(:redis))

# Load all lib files.
Dir[root_path("lib/**/*.rb")].each do |file|
  require file
end

# Load all application files.
Dir[root_path("app/**/*.rb")].each do |file|
  require file
end

if defined? Encoding
  Encoding.default_external = Encoding::UTF_8
end

Dir[root_path('config/locales/**/*.yml')].each do |file|
  I18n.load_path << file
end 

Main.run! if Main.run?
