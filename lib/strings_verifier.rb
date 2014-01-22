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

class App
  def run arguments
    if arguments.length != 1
      print_usage
      exit
    end

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
