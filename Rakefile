
task 'doc' do
    gem 'cmdparse', '2.0.6'
    require 'webgen/cli'
    Webgen::CLI::CommandParser.new.parse
end
task 'default' => 'doc'

