require 'rubygems'
require 'sinatra/base'

require 'sinatra_more/markup_plugin'
require File.dirname(__FILE__) + '/lib/vendor/rack-flash/rack-flash'

RAILS_ROOT = File.dirname(__FILE__)


require 'active_record'
ActiveRecord::Base.establish_connection(
:adapter  => "mysql",
:host     => "localhost",
:username => "root",
:password => "",
:database => "buildwise_local"
)

class Project < ActiveRecord::Base
end


class BuildWise < Sinatra::Base

  use Rack::Session::Cookie
  use Rack::Flash

  register SinatraMore::MarkupPlugin


  configure :developement do
    enable :sessions
  end

  set :environment, :development

  set :app_file,  __FILE__
  set :static, true


  get '/hi' do
    "Hello World! 2"
  end

  get '/projects/new' do
    @project = Project.new
    puts "DEBUG: #{@project.inspect}"
    erb "projects/new".to_sym
  end

end

BuildWise.run! :host => 'localhost', :port => 3618
