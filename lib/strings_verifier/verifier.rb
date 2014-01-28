module StringsVerifier
  class Verifier
    def starts_comment(line)
      line.start_with? "/*"
    end

    def is_localizable_string(line)
      line.start_with? '"'
    end

    def is_empty_line(line)
      line.length == 0
    end

    def process(source)
      # run through the source, 
      # collect errors to list and return it
    end
  end
end