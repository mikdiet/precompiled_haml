namespace :precompiled_haml do
  desc "Initial setup"
  task :install do
  end

  desc 'Cleanup'
  task :cleanup do
  end

  desc 'Precompile'
  task :precompile => :environment do
    ActionController::Base.view_paths.each do |path|
      Dir[File.join(path, '**/*.haml')].each do |haml|
        p haml
      end
    end
  end
end
