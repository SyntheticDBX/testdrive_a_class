require 'todo_list'

RSpec.describe TodoList do
    context 'when adding a new task' do
        it 'should be able to add a new task' do
            todo_list = TodoList.new
            todo_list.add('Walk the dog')
            expect(todo_list.list).to eq ['Walk the dog']
        end
        it 'should only accept strings' do
            todo_list = TodoList.new
            expect { todo_list.add(1) }.to raise_error 'Please only enter in a string'
        end
    end
    context 'when listing tasks' do
        it 'should be able to list all tasks' do
            todo_list = TodoList.new
            todo_list.add('Walk the dog')
            todo_list.add('Buy milk')
            expect(todo_list.list).to eq ['Walk the dog', 'Buy milk']
        end
    end
    describe '#completed' do
        context 'when a task is completed' do
            it 'should remove the task from the list' do
                todo_list = TodoList.new
                todo_list.add('Walk the dog')
                todo_list.completed('Walk the dog')
                task_complete = todo_list.list.index('Walk the dog')
                expect(task_complete).to eq nil
            end
            it 'should show tasks that are not completed' do
                todo_list = TodoList.new
                todo_list.add('Walk the dog')
                todo_list.add('Buy milk')
                todo_list.completed('Walk the dog')
                expect(todo_list.list).to eq ['Buy milk']
            end
        end
    end
end