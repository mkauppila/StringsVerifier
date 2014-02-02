module StringsVerifier
  class Source
    def initialize(raw_contents_of_file)
      @lines = split_file_contents_to_lines(raw_contents_of_file)
      @current_line = 0
    end

    def get_line
      @lines[@current_line]
    end

    def advance_to_next_line
      @current_line += 1
    end

    def number_of_lines
      @lines.size
    end

    private

    def split_file_contents_to_lines(file_contents)
      file_contents.split("\n")
    end
  end
end