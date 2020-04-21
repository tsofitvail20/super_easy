class ClassRoom
  attr_accessor :students
  def initialize(students)
    @students=students
  end

  def student_names
    @students.map(&:name).join(',')
  end

  def number_of_students
    @students.length
  end
end
