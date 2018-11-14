module StudentsHelper
  def st_is_advisor
    if @student.is_advisor == false and current_user.kind == 2
      link_to 'Do you want to be advisor?', new_advisor_path
    elsif @student.is_advisor == true or @student.is_advisor == nil
      if current_user.kind == 2
        link_to 'Access as advisor', advisor_path(id: Advisor.where(student_id: @student.id).first.id)
      else
        link_to 'View as advisor', advisor_path(id: Advisor.where(student_id: @student.id).first.id)
      end
    end
  end
end
