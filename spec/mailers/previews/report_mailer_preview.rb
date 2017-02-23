# Preview all emails at http://localhost:3000/rails/mailers/report_mailer
class ReportMailerPreview < ActionMailer::Preview

  def post_comment_statistic
    start_date = '2016-10-01 00:00:00'
    end_date = '2017-05-01 00:00:00'

    post_counts = Post.create_report(start_date, end_date)
    comment_counts = Comment.create_report(start_date, end_date)

    report_info = unite_counts(post_counts, comment_counts)
    report_info = flatten_counts(report_info)
    report_info = sort_counts(report_info)

    ReportMailer.post_comment_statistic(
      Rails.application.config.report_from_email,
      report_info
    )
  end

  private

  def unite_counts(posts, comments)
    res = {}
    posts.each { |key,value| res[key] = [value, 0] }

    comments.each do |key,value|
      if res.key?(key)
        res[key][1] = value
      else
        res[key] = [0, value]
      end
    end

    res
  end

  def flatten_counts(items)
    res = []
    items.each { |key,value| res << items.assoc(key).flatten }
    res
  end

  def sort_counts(items)
    items.sort do |a,b|
      (a[2] + a[3]/10.0) <=> (b[2] + b[3]/10.0)
    end
  end
end
