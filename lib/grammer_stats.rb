class GrammarStats
    def initialize
        @words = []
    end
  
    def check(text) # text is a string
      # returns true or false depending on whether the text begins or ends with a capital letter and ends with a sentence-ending punctuation mark.
        if text[0] == text[0].upcase && "!?.".include?(text[-1])
            return true
        else
            return false
        end
    end
  
    def percentage_good
        # returns the percentage of words that are grammatically correct
        correct_words = @words.select { |word| check(word) }
        (correct_words.length.to_f / @words.length.to_f * 100).to_i
    end
end