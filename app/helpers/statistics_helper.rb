module StatisticsHelper
  def subjects_by_advices
    column_chart @subjects.group(:name).count, height: '500px', xtitle: 'Subject', title: 'Subjects by advices', ytitle: 'Advices count'
  end
  def months_by_advices
    column_chart @months.group(:name).count, height: '500px', xtitle: 'Month', title: 'Month by advices', ytitle: 'Advices count'
  end
end
