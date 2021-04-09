require 'rspec'
require './lib/course'
require './lib/student'

describe Course do
  context '#initialize' do
    it 'exists' do
      course = Course.new("Calculus", 2)
      expect(course).to be_instance_of Course
    end
    it 'has a name' do
      course = Course.new("Calculus", 2)
      expect(course.name).to eq "Calculus"
    end
    it 'has a capacity' do
      course = Course.new("Calculus", 2)
      expect(course.capacity).to eq 2
    end
    it 'has students' do
      course = Course.new("Calculus", 2)
      expect(course.students).to eq []
    end
  end

  context '#full?' do
    it 'checks if the course is not full' do
      course = Course.new("Calculus", 2)
      expect(course.full?).to eq false
    end
    it 'checks if the course is full' do
      course = Course.new("Calculus", 2)
      student_1 = Student.new({name: "Morgan", age: 21})
      student_2 = Student.new({name: "Rich", age: 23})
      course.enroll(student_1)
      course.enroll(student_2)
      expect(course.full?).to eq true
    end
  end

  context '#enroll' do
    it 'enrolls a student to this course' do
      course = Course.new("Calculus", 2)
      student = Student.new({name: "Morgan", age: 21})
      course.enroll(student)
      expected_students = [student]
      expect(course.students).to eq expected_students
    end
  end
end
