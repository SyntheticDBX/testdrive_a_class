class DiaryEntry
    def initialize(title, contents) # title, contents are strings
      fail "Please ensure both title and contents are string values" unless title.is_a?(String) && contents.is_a?(String)
      @title = title
      @contents = contents
      @last_word_read = 0
    end
  
    def title
      #fail "Please ensure both title and contents are string values" unless title.is_a?(String) && contents.is_a?(String)
      return @title
    end
  
    def contents
      return @contents
    end
  
    def count_words
      # Returns the number of words in the contents as an integer
      fail "Please insert content" if @contents.empty?
      return contents.split(" ").length
    end
  
    def reading_time(wpm) # wpm is an integer representing the number of words the
                          # user can read per minute
      # Returns an integer representing an estimate of the reading time in minutes
      # for the contents at the given wpm.
      fail "Please ensure wpm given is above 0" unless wpm > 0
      reading_time = (count_words / wpm.to_f).ceil
      return reading_time
      
    end
  
    def reading_chunk(wpm, minutes) # `wpm` is an integer representing the number
                                    # of words the user can read per minute
                                    # `minutes` is an integer representing the
                                    # number of minutes the user has to read
      # Returns a string with a chunk of the contents that the user could read
      # in the given number of minutes.
      # If called again, `reading_chunk` should return the next chunk, skipping
      # what has already been read, until the contents is fully read.
      # The next call after that it should restart from the beginning.
      fail "Please ensure wpm given is above zero" unless wpm > 0
      fail "Please ensure minutes given is above zero" unless minutes > 0
      no_of_words = wpm * minutes
      words = @contents.split(" ")
      chunk = words[@last_word_read..@last_word_read + no_of_words-1].join(" ")
      @last_word_read += no_of_words
      @last_word_read = 0 if @last_word_read >= words.length
      return chunk
    end
  end