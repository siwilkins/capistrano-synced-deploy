require File.expand_path('../lib/capistrano/synced_folder/version', __FILE__)
Gem::Specification.new do |s|
  s.name       = 'capistrano-synced-folder'
  s.version    = CapistranoSyncedFolder::VERSION
  s.date       = '2016-06-06'
  s.summary    = 'Carries out capistrano deployment from a synced folder'
  s.authors    = ['Si Wilkins']
  s.email      = 'si.wilkins@gmail.com'
  s.files      = Dir['lib/**/*']
  s.test_files = s.files.grep(%r{^(test|spec|features)/})
end
