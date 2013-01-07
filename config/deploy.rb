require 'bundler/capistrano'

set :application, "gaetesting"
set :scm, :git
set :repository,  "git://github.com/mmcdaris/hostin.git"
set :scm_passphrase, ""
set :deploy_via, :rsync_with_remote_cache
# set :rsync_options, '-az --delete --exclude=.svn --delete-excluded'
set :use_sudo, false
set :user, "ubuntu"
ssh_options[:keys] = [File.join(ENV["HOME"], ".ec2", "gsg-keypair")]
ssh_options[:forward_agent] = true
#### #default_run_options[:pty] = true
#set :rake, "/usr/local/bin/rake"
set :deploy_via, :remote_cache

set :bundle_cmd, 'source $HOME/.bash_profile && bundle'

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`


set :location, "50.16.144.130"
server location, :app, :primary => true
set :deploy_to, "/mnt/#{application}"

role :web, location                          # Your HTTP server, Apache/etc
role :app, location                          # This may be the same as your `Web` server
role :db,  location,  :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#  task :start do ; end
#  task :stop do ; end
#  task :restart, :roles => :app, :except => { :no_release => true } do
#    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#  end
#end

#
# # Load RVM's capistrano plugin.    
# require "rvm/capistrano"
#
# set :rvm_ruby_string, "1.9.3"

