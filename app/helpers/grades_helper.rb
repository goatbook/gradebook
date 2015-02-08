module GradesHelper

  def student_grades(student)
    grades = student.grades
    result = "<table>"
    if session[:teacher_id] && grades
      grades.each do |g|
        result << "<tr>"
        # result << "<td>#{g.description}</td>"
        # result << "<td>#{g.score}</td>"
        result << "</tr>"
      end
      result << "</table>"
    elsif session[:student_id] && grades
      grades.each do |g|
        result << "<tr>"
        result << "<td>#{g.description}</td>"
        result << "<td>#{g.score}</td>"
        result << "</tr>"
      end
      result << "</table>"
    elsif session[:parent_id] && grades
      grades.each do |g|
        result << "<tr>"
        result << "<td>#{g.description}</td>"
        result << "<td>#{g.score}</td>"
        result << "</tr>"
      end
    end
    result << "</table>"
    result.html_safe
  end
end
