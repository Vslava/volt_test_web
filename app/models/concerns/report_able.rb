module ReportAble
  extend ActiveSupport::Concern

  class_methods do
    def get_report_data(start_date, end_date)
      by_published_at(start_date, end_date).group_by_author.count
    end
  end
end
