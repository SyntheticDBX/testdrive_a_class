require 'diary_entry'

RSpec.describe DiaryEntry do
    it "returns both title and contents correctly" do
        diary_entry = DiaryEntry.new("my_title", "my_contents")
        expect(diary_entry.title).to eq "my_title"
        expect(diary_entry.contents).to eq "my_contents"
    end
    context "title and contents only allows strings" do
        it "fails" do
            expect {DiaryEntry.new(123, 2)}.to raise_error "Please ensure both title and contents are string values"
        end
    end
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
    
    describe "#reading_chunk" do
        context "with a contents readable within a given time" do
            it "returns full string" do
                diary_entry = DiaryEntry.new("my_title", "my contents here")
                expect(diary_entry.reading_chunk(100, 1)).to eq "my contents here"
            end
        end
        context "with a contents only partiablly readable within a given time" do
            it "returns some of the contents" do
                diary_entry = DiaryEntry.new("my_title", "my contents here")
                expect(diary_entry.reading_chunk(2, 1)).to eq "my contents"
            end
            it "returns the next chunk" do
                diary_entry = DiaryEntry.new("my_title", "my contents here")
                diary_entry.reading_chunk(2,1)
                chunk = diary_entry.reading_chunk(2,1)
                expect(chunk).to eq "here"
            end
        end
        context "contents full read within given time" do
            it "restarts from the beginning" do
                diary_entry = DiaryEntry.new("my_title", "my contents here")
                diary_entry.reading_chunk(2, 1)
                diary_entry.reading_chunk(2, 1)
                chunk = diary_entry.reading_chunk(2, 1)
                expect(chunk).to eq "my contents"
            end
        end

        context "wpm is 0" do
            it "fails" do
                diary_entry = DiaryEntry.new("my_title", "my contents here")
                expect {diary_entry.reading_chunk(0, 1)}.to raise_error "Please ensure wpm given is above zero"
            end
        end

        context "minutes is 0" do
            it "fails" do
                diary_entry = DiaryEntry.new("my_title", "my contents here")
                expect {diary_entry.reading_chunk(1, 0)}.to raise_error "Please ensure minutes given is above zero"
            end
        end
    end 
end