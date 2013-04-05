module PrecompiledHaml
  class Railtie < ::Rails::Railtie
    initializer :precompiled_haml do |app|
      require "precompiled_haml/plugin"
    end

    rake_tasks do
      load File.expand_path('../tasks.rb', __FILE__)
    end
  end
end
