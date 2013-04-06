namespace :precompiled_haml do
  desc "Initial setup"
  task :install do
  end

  desc 'Cleanup'
  task :cleanup do
  end

  desc 'Precompile'
  task :precompile => :environment do
    precompiled_files = {}
    target_path = Rails.root.join('app/precompiled_views')

    ActionController::Base.view_paths.each do |path|
      path = path.to_s

      Dir[File.join(path, '**/*.haml')].each do |haml|
        haml.slice! path
        if precompiled_files[haml]
          puts "#{path} -> #{haml} already was precompiled"
        else
          precompiled_files[haml] = path
          precompiled_name = File.join target_path, haml.sub(/haml\z/, 'precompiled_haml')
          FileUtils.mkdir_p File.dirname precompiled_name
          File.open precompiled_name, 'w' do |f|
            # TODO. This precompiling must be more complicated (because it's type-dependent)
            tmpl = File.read(File.join path, haml)
            f.puts Haml::Engine.new(tmpl, Haml::Template.options.dup).compiler.precompiled
          end
          puts "#{precompiled_name} compiled!"
        end
      end
    end
  end
end
