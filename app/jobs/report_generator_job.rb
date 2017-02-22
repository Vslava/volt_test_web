class ReportGeneratorJob < ApplicationJob
  queue_as :default

  def perform(start_date, end_date, email)
  end
end
