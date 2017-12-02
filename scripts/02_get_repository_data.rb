require "active_record"
require "yaml"
require "./app/models/repository"

config = YAML.load_file('./config/database.yml')
ActiveRecord::Base.establish_connection(config["development"])

is_app_list = false

begin
  File.open('files/01_awesome_rails_readme.md') do |file|
    file.each_line do |line|
      is_app_list = true if line.include?("### Apps Made with Rails")
      is_app_list = false if line.include?("### Tutorials")
      Repository.find_or_create_by!(name: line.match(%r{https://github.com/(.+?)\)})[1]) if is_app_list && line.include?("https://github.com")
    end
  end
rescue SystemCallError => e
  puts %Q(class=[#{e.class}] message=[#{e.message}])
rescue IOError => e
  puts %Q(class=[#{e.class}] message=[#{e.message}])
end
