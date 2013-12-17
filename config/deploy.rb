ssh_options[:forward_agent] = true
default_run_options[:pty] = true

set :deploy_to, '/var/www/lootr.virtualbind.com'

set :application, "loottrackr"
set :repository,  "git@github.com:bryansray/loottrackr.git"

set :scm, :git
set :user, "root"

role :web, "50.116.23.150"                          # Your HTTP server, Apache/etc
role :app, "50.116.23.150"                          # This may be the same as your `Web` server
role :db,  "50.116.23.150", :primary => true # This is where Rails migrations will run
role :db,  "50.116.23.150"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end

after :deploy, 'deploy:link_dependencies'

namespace :deploy do
  desc <<-DESC
  Creates symbolic links to configuration files and other dependencies.
  DESC
  task :link_dependencies, :roles => :app do
    run "ln -nfs #{shared_path}/cache #{release_path}/public/cache"
  end
  
  desc "Start the Thin processes"
  task :start do
    run "thin start -C /etc/thin/lootr.yml"
  end
  
  desc "Stop the Thin processes"
  task :stop do
    run "thin stop -C /etc/thin/lootr.yml"
  end
  
  desc "Restart the Thin processes"
  task :restart do
    run "thin restart -C /etc/thin/lootr.yml"
  end
end