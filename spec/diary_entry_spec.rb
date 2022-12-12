require 'diary_entry'

RSpec.describe DiaryEntry do
    it "returns both title and contents correctly" do
        diary_entry = DiaryEntry.new("my_title", "my_contents")
        expect(diary_entry.title).to eq "my_title"
        expect(diary_entry.contents).to eq "my_contents"
    end
    # context "title and contents only allows strings" do
    #     it "fails" do
    #         diary_entry = DiaryEntry.new(133, 34.3)
    #         expect {diary_entry.title}.to raise_error "Please ensure both title and contents are string values"
    #     end
    # end
    describe "#count_words" do
        it "returns number of words in content as an integer" do
            diary_entry = DiaryEntry.new("my_title", "my contents here")
            expect(diary_entry.count_words).to eq 3
        end
        it "returns error for empty string" do 
            diary_entry = DiaryEntry.new("my_title", "")
            expect {diary_entry.count_words}.to raise_error "Please insert content"
        end
    end
    describe "#reading_time" do
        context "wpm is logical" do
            it "returns ceiling integer value for reading time" do
                diary_entry = DiaryEntry.new("my_title", "my contents here")
                expect(diary_entry.reading_time(100)).to eq 1
            end
        end
        context "wpm is zero" do
            it "fails" do
                diary_entry = DiaryEntry.new("my_title", "my contents here")
                expect { diary_entry.reading_time(0) }.to raise_error "Please ensure wpm given is above 0"
            end
        end
    end
end