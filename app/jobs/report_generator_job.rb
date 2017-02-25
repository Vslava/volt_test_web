class ReportGeneratorJob < ApplicationJob
  queue_as :default

  def perform(start_date, end_date, email)
    post_counts = Post.get_report_data(start_date, end_date)
    comment_counts = Comment.get_report_data(start_date, end_date)

    report_info = unite_counts(post_counts, comment_counts)
    report_info = flatten_counts(report_info)
    report_info = sort_counts(report_info)

    ReportMailer.post_comment_statistic(email, report_info).deliver_now
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
