=begin

As a user
So that I can keep track of my tasks
I want a program that I can add todo tasks to and see a list of them.

As a user
So that I can focus on tasks to complete
I want to mark tasks as complete and have them disappear from the list.

=end
class TodoList
    def initialize
        @tasks = []
    end

    def add(task)
        fail "Please only enter in a string" unless task.is_a? String
        @tasks << task
    end

    def list
        return @tasks
    end

    def completed(task)
        task_complete = @tasks.index(task)
        @tasks.delete_at(task_complete)
    end
end