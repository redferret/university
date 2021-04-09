require 'rspec'
require './lib/term'
require './lib/course'
require './lib/student'

describe Term do
  context '#initialize' do
    it 'exists' do
      term = Term.new("Winter 2018")
      expect(term).to be_instance_of Term
    end
    it 'has a name' do
      term = Term.new("Winter 2018")
      expect(term.name).to eq "Winter 2018"
    end
    it 'has courses' do
      term = Term.new("Winter 2018")
      expect(term.courses).to eq []
    end
  end

  context '#add_course' do
    it 'adds a course to this term' do
      term = Term.new("Winter 2018")
      course = Course.new("Calculus", 2)
      term.add_course(course)
      expected_courses = [course]
      expect(term.courses).to eq expected_courses
    end
  end

  context '#available_courses' do
    it 'is has available_courses that are open' do
      term = Term.new("Winter 2018")
      course = Course.new("Calculus", 2)
      term.add_course(course)
      expected_courses = [course]
      expect(term.available_courses).to eq expected_courses
    end
    it 'shows no courses if all are full' do
      term = Term.new("Winter 2018")
      course = Course.new("Calculus", 1)
      student = Student.new({name: "Morgan", age: 21})
      course.enroll(student)
      term.add_course(course)
      expected_courses = []
      expect(term.available_courses).to eq expected_courses
    end
  end

  context '#all_students' do
    it 'shows all students across all courses' do
      term = Term.new("Winter 2018")

      course1 = Course.new("Calculus", 3)
      course2 = Course.new("Computer Science", 2)

      student1 = Student.new({name: "Morgan", age: 21})
      student2 = Student.new({name: "Rich", age: 25})
      student3 = Student.new({name: "David", age: 33})
      student4 = Student.new({name: "Mark", age: 22})

      course1.enroll(student1)
      course1.enroll(student2)
      course2.enroll(student3)
      course2.enroll(student4)

      term.add_course(course1)
      term.add_course(course2)

      expected_students = [student1, student2, student3, student4]
      expect(term.all_students).to eq expected_students
    end
  end
end
