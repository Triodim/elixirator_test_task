class ExpireTasksJob < ApplicationJob
  queue_as :default

  def perform
    Task.where(active: true).where("expired_at <= ?", Time.current).find_each do |task|
      task.update!(active: false)
    end
  end
end