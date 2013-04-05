module PrecompiledHaml
  class Compiler < Haml::Compiler
    def compile(node)
      @precompiled = node
    end
  end
end
