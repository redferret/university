class Course
  attr_reader :name, :capacity, :students
  def initialize(name, cap)
    @name = name
    @capacity = cap
    @students = []
  end

  def full?
    @students.length == capacity
  end

  def enroll(student)
    @students << student
  end
end
