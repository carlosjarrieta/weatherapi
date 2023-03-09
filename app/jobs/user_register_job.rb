class UserRegisterJob < ApplicationJob
  queue_as :users_emails

  def perform(*args)
    puts "Online..."
  end
end
