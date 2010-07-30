require 'rubygems'
require 'sinatra/base'

require 'sinatra_more/markup_plugin'
require File.dirname(__FILE__) + '/lib/vendor/rack-flash/rack-flash'

RAILS_ROOT = File.dirname(__FILE__)
DATA_ROOT = "/Users/zhimin/.buildwise"

require 'active_record'
# ActiveRecord::Base.establish_connection(
# :adapter  => "mysql",
# :host     => "localhost",
# :username => "root",
# :password => "",
# :database => "buildwise_local"
# )

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database =>  'db/buildwise_test.db'
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

  
  ## Project
  #
  get '/projects' do
    @projects = Project.all
    erb "projects/index".to_sym
  end
  
  get '/projects/new' do
    @project = Project.new
    puts "DEBUG: #{@project.inspect}"
    erb "projects/new".to_sym
  end

  post '/projects' do
    @project = project.new(params[:project])
    if @project.save
      redirect "/projects/#{@project.id}"
    else
      "There was a problem saving that..."
    end
  end
  
  get '/projects/:id' do
    @post = Post.find(params[:id])
    erb "projects/show".to_sym
  end
  
end

BuildWise.run! :host => 'localhost', :port => 3618
