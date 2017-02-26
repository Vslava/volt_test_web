class ReportGeneratorJob < ApplicationJob
  queue_as :default

  def perform(start_date, end_date, email)
    report_generator = ReportGenerator.call(start_date, end_date)

    if report_generator.success?
      ReportMailer.post_comment_statistic(email, report_generator.result).deliver_now
    end
  end
end
