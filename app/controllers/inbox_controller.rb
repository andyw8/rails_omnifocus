class InboxController < ApplicationController
  def show
    @tasks_by_project = Task.in_inbox.available.group_by do |task|
      task.parent_name
    end
  end
end
