module StringsVerifier

  class Verifier

    def process(source)
      @source = source

      @line_count = 0
      @column_count = 0

      @ch = ''

      while peeked = @source.peek
        if is_whitespace? peeked
          parse_whitespace
        elsif peeked == "/"
          parse_comment
        elsif peeked == "\""
          parse_translation_string
        else
          puts "Error"
          exit89 # Quick exit through non-bound local variable
        end

        peeked = @source.peek
      end

      puts "-All analyzed"
      puts "-line count: #{@line_count}"
    end

    def parse_comment
      comment_contents = ""

      advance_to_next_character # eatCharacter /

      advance_to_next_character # eatCharacter *
      puts @ch
      if @ch == "*"
        advance_to_next_character

        # loop as long as @ch is :alnum:
        comment_contents << @ch

        while @ch != "*" and @source.peek != "/"
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

        puts "- " + @ch
        advance_to_next_character
        puts "- " + @ch
        advance_to_next_character

        while @ch != "\""
          key << @ch
          # Validate the character againt a setl
          advance_to_next_character
        end

        advance_to_next_character

        #parse whitespace (no cr/lf)

        if @ch != "="
          puts "Expected =, got #{@ch}"
        else
          puts "ok"
        end
        
        #parse_whitespace (no cr/lf)
        advance_to_next_character
        advance_to_next_character

        while @ch != "\""
          value << @ch
          advance_to_next_character
        end

        advance_to_next_character

        puts "[D] parsing translation string: #{key} - #{value}"
    end

    def parse_whitespace 
      # Remvoe peek, and use next here?
      while is_whitespace? @source.peek
        advance_to_next_character
      end
    end

    def advance_to_next_character
      @ch = @source.next
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