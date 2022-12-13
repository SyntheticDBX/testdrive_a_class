class MusicTracker
    def initialize
        @songs = []
    end

    def track(add)
        fail "Please enter in a string." unless add.is_a? String
        @songs << add
    end

    def list
        return @songs
    end

    def listened_to(completed)
        #adds songs completed to new array
        #removes songs that have been completed from original array
        #returns the new array
        @songs_listened_to = []
        @songs_listened_to << completed
        @songs.delete(completed)
    end
end