module PrecompiledHaml
  class Parser < Haml::Compiler
    def compile(node)
      @precompiled = node
    end
  end
end
