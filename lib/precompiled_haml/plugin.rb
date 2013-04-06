module PrecompiledHaml
  class Plugin < Haml::Plugin
    def compile(template)
      options = Haml::Template.options.dup
      if (ActionPack::VERSION::MAJOR >= 4) && template.respond_to?(:type)
        options[:mime_type] = template.type
      elsif template.respond_to? :mime_type
        options[:mime_type] = template.mime_type
      end
      options[:filename] = template.identifier
      PrecompiledHaml::Engine.new(template.source, options).compiler.precompiled_with_ambles([])
    end
  end
end

ActionView::Template.register_template_handler(:precompiled_haml, PrecompiledHaml::Plugin)
ActionController::Base.prepend_view_path(Rails.root.join('app/precompiled_views'))
