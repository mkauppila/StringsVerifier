module StringsVerifier
  class Verifier

    def process(source)
      @source = source
      @line_count = 0
      @column_count = 0

      @source_enumerator = @source.each_char
      @ch = ''

      begin
        while true 
          advance_to_next_character

          if is_whitespace? @ch
            parse_whitespace
          elsif @ch == "/"
            parse_comment
          elsif @ch == "\""
            parse_translation_string
          end

        end
      rescue StopIteration
        puts "End of File"
      ensure
        puts "-All analyzed"
        puts "-line count: #{@line_count}"
      end
    end

    def parse_comment
      comment_contents = ""

      advance_to_next_character
      puts @ch
      if @ch == "*"
        advance_to_next_character

        # loop as long as @ch is :alnum:
        comment_contents << @ch

        while @ch != "*" and @source_enumerator.peek != "/"
          comment_contents << @ch
          advance_to_next_character
        end
      else
        puts "Was expecting * for a comment start, got #{@ch}"
      end

      puts "[D] parsed comment '#{comment_contents}'"
    end

    def character_should_be 
      # validate and if not valid, add an error!
    end

    def parse_translation_string
        key = ""
        value = ""

        advance_to_next_character

        while @ch != "\""
          key << @ch
          advance_to_next_character
        end

        advance_to_next_character

        #parse whitespace

        if @ch != "="
          puts "Expected =, got #{@ch}"
        else
          puts "ok"
        end
        
        #parse_whitespace
        advance_to_next_character
        advance_to_next_character

        while @ch != "\""
          value << @ch
          advance_to_next_character
        end

        puts "[D] parsing translation string: #{key} - #{value}"
    end

    def parse_whitespace 
      while is_whitespace? @source_enumerator.peek
        advance_to_next_character
      end
    end

    def advance_to_next_character
      @ch = @source_enumerator.next
      #puts "advanced to #{@ch}"
    end

    def is_whitespace? character
      character =~ /[[:space:]]/
    end


    # here for the tests, prune them!
    def verify_comment(line) 
    end

    def starts_comment?(line)
      line = remove_extra_whitespace(line)
      line.start_with? "/*"
    end

    def is_localizable_string?(line)
      line = remove_extra_whitespace(line)
      line.start_with? '"'
    end

    def is_empty_line?(line)
      line = remove_extra_whitespace(line)
      line.empty?
    end

    private 

    def remove_extra_whitespace(line)
      line.strip
    end
  end
end