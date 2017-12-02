require "active_record"
require "yaml"
require 'open3'
require "./app/models/column"
require "./app/models/repository"
require "./app/models/table"

config = YAML.load_file('./config/database.yml')
ActiveRecord::Base.establish_connection(config["development"])

is_table = false
table = nil

begin
  Repository.all.each do |repository|
    filename = repository.name.match(%r{\/(.*)})[1]
    File.open("files/#{filename}.rb") do |file|
      file.each_line do |line|
        is_table = true if line.include?("create_table")
        is_table = false if line.include?("end")
        next unless is_table
        if line.include?("create_table")
          table = Table.find_or_create_by!(name: line.match(%r{create_table \"(.+?)\"})[1], repository: repository)
        end 
        if line.include?("t.") && !line.include?("t.index")
          Column.find_or_create_by!(
            name: line.match(%r{\"(.+?)\"})[1],
            data_type: line.match(%r{t.(.+?)\s})[1],
            table: table
          )
        end
      end
    end
  end
rescue SystemCallError => e
  puts %Q(class=[#{e.class}] message=[#{e.message}])
rescue IOError => e
  puts %Q(class=[#{e.class}] message=[#{e.message}])
end
