module PrecompiledHaml
  class Options < Haml::Options
    @defaults = superclass.defaults.merge({
      :parser_class         => ::PrecompiledHaml::Parser,
      :compiler_class       => ::PrecompiledHaml::Compiler
    })

    @valid_formats = superclass.valid_formats

    @buffer_option_keys = superclass.buffer_option_keys

  end
end
