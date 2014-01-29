module StringsVerifier
  class Verifier
    def starts_comment?(line)
      line = remove_extra_whitespace(line)
      line.start_with? "/*"
    end

    def is_localizable_string?(line)
      line.start_with? '"'
    end

    def is_empty_line?(line)
      line = remove_extra_whitespace(line)
      line.empty?
    end

    def process(source)
      # run through the source, 
      # collect errors to list and return it
    end

    private 

    def remove_extra_whitespace(line)
      line.strip
    end
  end
end