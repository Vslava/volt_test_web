class ReportMailer < ApplicationMailer
  default from: Rails.application.config.report_from_email

  def post_comment_statistic(email, info)
    @info = info
    mail(to: email, subject: "REPORT: Post and Comment statistics")
  end
end
