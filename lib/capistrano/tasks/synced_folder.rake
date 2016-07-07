namespace :synced_folder do

  def synced_path
    "#{deploy_to}/synced"
  end

  task :check do
  end

  task :create_release do
    on release_roles :all do
      within deploy_to do
        execute :cp, '-rv', synced_path, release_path
      end
    end
  end

  task :set_current_revision do
  end

end
