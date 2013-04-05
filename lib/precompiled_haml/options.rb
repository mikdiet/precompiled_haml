module PrecompiledHaml
  class Options < Haml::Options
    @defaults.merge({
      :parser_class         => ::PrecompiledHaml::Parser,
      :compiler_class       => ::PrecompiledHaml::Compiler
    })
  end
end
