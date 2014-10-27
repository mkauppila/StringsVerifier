module StringsVerifier

  class Source
    
    def initialize(source_text)
      @enumerator = source_text.each_char
      # Move on the first character by default
      self.next
    end

    def current_character
      @ch
    end

    def next 
      begin
        @ch = @enumerator.next
      rescue StopIteration
        @ch = nil
      end
    end

    def peek 
      begin
        @enumerator.peek
      rescue StopIteration
        nil
      end
    end

  end

end