class Term
  attr_reader :name, :courses

  def initialize(name)
    @name = name
    @courses = []
  end

  def add_course(course)
    @courses << course
  end

  def available_courses
    @courses.filter_map do |course|
      course if not course.full?
    end
  end

  def all_students
    @courses.inject([]) do |students, course|
      students += course.students
    end
  end

end
