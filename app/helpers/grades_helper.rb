module GradesHelper

  def student_grades(student)
    grades = student.grades
    result = "<table>"
    if session[:user] == "teacher"
      teacher = Teacher.find(params[:id])
      if teacher
        grades.each do |grade|
          result << "<tr>"
          result << "<td>#{grade.date}</td>"
          result << "<td>#{grade.description}</td>"
          result << "<td>#{grade.score}</td>"
          result << "</tr>"
        end
      end
    elsif session[:user] == "student"
      student = Student.find(params[:id])
      if student
        grades.each do |grade|
          result << "<tr>"
          result << "<td>#{grade.date}</td>"
          result << "<td>#{grade.description}</td>"
          result << "<td>#{grade.score}</td>"
          result << "</tr>"
        end
      end
    elsif session[:user] == "parent"
      parent = Parent.find(params[:id])
      if parent
        grades.each do |grade|
          result << "<tr>"
          result << "<td>#{grade.date}</td>"
          result << "<td>#{grade.description}</td>"
          result << "<td>#{grade.score}</td>"
          result << "</tr>"
        end
      end
    end
    result << "</table>"
    result.html_safe
  end
end
