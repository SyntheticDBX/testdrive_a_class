require 'music_tracker'

RSpec.describe MusicTracker do
    describe '#track' do
        it 'adds a song' do
            music_tracker = MusicTracker.new
            music_tracker.track('song')
            expect(music_tracker.list).to eq ['song']
        end
        it 'fails' do
            music_tracker = MusicTracker.new
            expect { music_tracker.track(1) }.to raise_error "Please enter in a string."
        end
    end
    describe '#list' do
        it 'lists the songs' do
            music_tracker = MusicTracker.new
            music_tracker.track('song')
            music_tracker.track('song2')
            music_tracker.track('song3')
            expect(music_tracker.list).to eq ['song', 'song2', 'song3']
        end
    end
    describe '#listened_to' do
        it 'shows the songs that have been listened to' do
            music_tracker = MusicTracker.new
            music_tracker.track('song')
            music_tracker.track('song2')
            music_tracker.listened_to('song')
            expect(music_tracker.list).to eq ['song2']
        end
    end
end