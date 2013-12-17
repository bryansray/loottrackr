set :application, 'lootr'
set :repo_url, 'git@github.com:bryansray/loottrackr.git'

# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

set :deploy_to, '/var/www/lootr.virtualbind.com'
set :scm, :git

# set :format, :pretty
# set :log_level, :debug
# set :pty, true

# set :linked_files, %w{config/database.yml}
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# set :default_env, { path: "/opt/ruby/bin:$PATH" }
# set :keep_releases, 5

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  after :finishing, 'deploy:cleanup'

end

# after :deploy, 'deploy:link_dependencies'

# namespace :deploy do
#   desc <<-DESC
#   Creates symbolic links to configuration files and other dependencies.
#   DESC
#   task :link_dependencies, :roles => :app do
#     run "ln -nfs #{shared_path}/cache #{release_path}/public/cache"
#   end
  
#   desc "Start the Thin processes"
#   task :start do
#     run "thin start -C /etc/thin/lootr.yml"
#   end
  
#   desc "Stop the Thin processes"
#   task :stop do
#     run "thin stop -C /etc/thin/lootr.yml"
#   end
  
#   desc "Restart the Thin processes"
#   task :restart do
#     run "thin restart -C /etc/thin/lootr.yml"
#   end
# end