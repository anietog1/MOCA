module StatisticsHelper
  def subjects_by_advices
    pie_chart @subjects.group(:name).count, height: '500px', xtitle: 'Subject', title: 'Subjects by advices', ytitle: 'Advices count'
  end
  def months_by_advices
    line_chart @advices.group(:name).count, height: '500px', xtitle: 'Month', title: 'Month by advices', ytitle: 'Advices count'
  end
end
