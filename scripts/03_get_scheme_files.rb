require "active_record"
require "yaml"
require "./app/models/repository"
require 'open3'

config = YAML.load_file('./config/database.yml')
ActiveRecord::Base.establish_connection(config["development"])

Repository.all.each do |repository|
  filename = repository.name.match(%r{\/(.*)})[1]
  Open3.capture3("wget -O files/#{filename}.rb https://raw.githubusercontent.com/#{repository.name}/master/db/schema.rb")
end
