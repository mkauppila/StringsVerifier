class App
  def run arguments
    if arguments.length != 1
      print_usage
      exit
    end

    filename = arguments.first

    print "filename: #{filename}\n"
  end

  def print_usage
    print "usage: ./strings-verifier strings-file\n"
  end
end

app = App.new
app.run ARGV
