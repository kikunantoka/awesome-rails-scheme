require "active_record"
require "yaml"
require 'open3'
require "./app/models/column"
require "./app/models/column_word"
require "./app/models/repository"
require "./app/models/table"
require "./app/models/table_word"

config = YAML.load_file('./config/database.yml')
ActiveRecord::Base.establish_connection(config["development"])

Table.all.each do |table|
  table.name.split("_").each do |word|
    TableWord.find_or_create_by!(name: word, table: table)
  end
end

Column.all.each do |column|
  column.name.split("_").each do |word|
    ColumnWord.find_or_create_by!(name: word, column: column)
  end
end
