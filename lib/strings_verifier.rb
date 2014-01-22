class Parser
  def initialize(file)
    @file = file 
  end

  def starts_comment?
  end
end

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
end

class Source
  def initialize(raw_contents)
    @lines = raw_contents.split("\n")
    @current_line = 0
  end

  def get_line
    line = @lines[@current_line]
    @current_line += 1
    line
  end
end

class StringsVerifier
  def run arguments
    if arguments.length != 1
      print_usage
      return
    end


    line_counter = 1
    raw_contents = File.read(arguments.first)
    source = Source.new(raw_contents)
    loop do
      line = source.get_line
      if line.nil?
        break
      end
      print "#{line_counter} '#{line}'\n"

      line_counter += 1
    end

    return 


    verifier = Verifier.new

    filename = arguments.first
    counter = 1
    File.open(filename) do |file|
      file.each do |line|

        line.strip!

=begin 
      if verifier.starts_comment(line)
        read the entire comment and go on
      elsif verifier.is_localizable_string
        verify the string and go aon
      elsif on empty line
         just go on
      else
        print the errornous line and give a syntax error
      end
=end
        print "#{counter} #{line}"


        if verifier.is_localizable_string(line)
          print "is a local string\n"
        elsif verifier.is_empty_line(line)
          print "is empty line\n"
        else 
          print "did recognize: '#{line}'\n"
        end


        counter += 1
      end
    end
  end

  def print_usage
    print "usage: ./strings-verifier strings-file\n"
  end
end
