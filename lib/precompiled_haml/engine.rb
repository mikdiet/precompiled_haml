require 'precompiled_haml/parser'
require 'precompiled_haml/compiler'
require 'precompiled_haml/options'

module PrecompiledHaml
  class Engine < Haml::Engine
    # This is identical to Haml::Engine#initialize, cause I don't undestand how
    # to call super method in inhereted class context (to use
    # PrecompiledHaml::Options instead of Haml::Options)
    # https://gist.github.com/Mik-die/5321100
    def initialize(template, options = {})
      @options = Options.new(options)

      @template = check_haml_encoding(template) do |msg, line|
        raise Haml::Error.new(msg, line)
      end

      initialize_encoding options[:encoding]

      @parser   = @options.parser_class.new(@template, @options)
      @compiler = @options.compiler_class.new(@options)

      @compiler.compile(@parser.parse)
    end
  end
end
