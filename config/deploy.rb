default_run_options[:pty] = true

set :application, "LootTrackr"
set :repository,  "git@github.com:bryansray/loottrackr.git"

set :scm, :git
set :user, "bryanray"

role :web, "50.116.23.62"                          # Your HTTP server, Apache/etc
role :app, "50.116.23.62"                          # This may be the same as your `Web` server
role :db,  "50.116.23.62", :primary => true # This is where Rails migrations will run
role :db,  "50.116.23.62"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end