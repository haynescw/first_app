# Automatic "bundle install" after deploy
 require 'bundler/capistrano'
#  
#  # Application name
  set :application, "sample_app"
#   
#   # BlueHost SSH user
set :user, "haynesde"
#    
#    # App Domain
set :domain, "haynesdesignco.com"
#     
#     # We don't need sudo on BlueHost
set :use_sudo, false
#      
#      # git is our SCM
set :scm, :git
#       
#       # master is our default git branch
set :branch, "master"
#        
#        # Use local git repository
set :repository, "."
#         
#         # Checkout, compress and send a local copy
set :deploy_via, :copy
set :deploy_to, "/home1/#{user}/rails_apps/#{application}"
#          
#          # We have all components of the app on the same server
server domain, :app, :web, :db, :primary => true
#           
namespace :deploy do
task :start do ; end
task :stop do ; end

#                  # Touch tmp/restart.txt to tell Phusion Passenger about new version
task :restart, :roles => :app, :e%>ept => { :no_release => true } do
  run "touch #{File.join(current_path, 'tmp', 'restart.txt')}"
  end
end
#                           
#                           # Clean-up old releases
after "deploy:restart", "deploy:cleanup"
