require 'grammer_stats'

RSpec.describe GrammarStats do
    describe "#check" do
        context "takes correctly punctuated text as argument" do
            it "returns true for fullstop" do
                grammar_stats = GrammarStats.new
                result = grammar_stats.check("Hello.")
                expect(result).to eq true
            end
            it "returns true for question mark" do
                grammar_stats = GrammarStats.new
                result = grammar_stats.check("Hello?")
             expect(result).to eq true
            end
            it "returns true for exclamation mark" do
                grammar_stats = GrammarStats.new
                result = grammar_stats.check("Hello!")
                expect(result).to eq true
            end
            it "returns true for capital letter" do
                grammar_stats = GrammarStats.new
                result = grammar_stats.check("Hello!")
                expect(result).to eq true
            end
            it "returns false for capital letter without punctuation mark" do
                grammar_stats = GrammarStats.new
                result = grammar_stats.check("Hello")
                expect(result).to eq false
            end
        end
    end
    describe "#percentage_good" do
        context "takes an array of words as argument" do
            it "returns 100% for all correct words" do
                grammar_stats = GrammarStats.new
                grammar_stats.instance_variable_set(:@words, ["Hello.", "Hello?"])
                result = grammar_stats.percentage_good
                expect(result).to eq 100
            end
            it "returns 0% for all incorrect words" do
                grammar_stats = GrammarStats.new
                grammar_stats.instance_variable_set(:@words, ["Hello", "Hello"])
                result = grammar_stats.percentage_good
                expect(result).to eq 0
            end
            it "returns 50% for half correct words" do
                grammar_stats = GrammarStats.new
                grammar_stats.instance_variable_set(:@words, ["Hello.", "Hello"])
                result = grammar_stats.percentage_good
                expect(result).to eq 50
            end
        end
    end
end
