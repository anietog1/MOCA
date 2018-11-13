class StatisticsForAdvicesController < ApplicationController
  def index
    @months = Session.joins(:session_has_students, :month)
    @subjects = Subject.joins(:sessions)
    @careers = Student.joins(:sessions, :undergraduates).group(:undergraduates)
    # Idea: Subject.joins(:sessions).where(:name => "Calculo I").group(:name).count
  end
end
