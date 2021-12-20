class DemoJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts "*" * 100
    puts "STARTING DEMO"
    sleep 3
    puts "DONE"
  end
end
