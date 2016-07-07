# capistrano-synced-deploy
Capistrano plugin to deploy from a synced vagrant folder. This will allow a capified project to be used within a vagrant box attached to a different codebase, and also to enable any capistrano tasks - such as builds and restarts - to be carried out on the vagrant box.

## Installation

Setup capistrano as normal.

Then add the following to your Gemfile:

    gem 'capistrano-synced-folder'

and run

    bundle install
    
Create a stage for your vagrant stage (eg. config/deploy/vagrant.rb) with the following config (replacing <values> with appropriate values)

    role :idp, %w{<ssh-username>@localhost}
    vagrant_key = File.expand_path(File.dirname(__FILE__)) + '/../../../<vagrant-project>/.vagrant/machines/default/virtualbox/private_key'
    set :ssh_options, {port: 2222, keys: [vagrant_key]}
    set :scm, :synced_folder
    
If you are using an ssh-username other than vagrant, then you will need to copy the authorized_keys file to the appropriate user on the vagrant box. Eg.

    cp /home/vagrant/.ssh/authorized_keys /home/<user>/.ssh/authorized_keys
    
In the Vagrantfile, set your capified project directory to be synced to the <deploy_to>/synced directory. Eg.

    config.vm.synced_folder "../<capified-project-directory", "<deploy-to>/synced"
    
Then from your vagrant project directory, you can run

    vagrant up
    
and then deploy from your capified project directory

    bundle exec cap vagrant deploy
    
