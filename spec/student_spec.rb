require 'rspec'
require './lib/student'

describe Student do
  context '#initalize' do
    it 'exists' do
      student = Student.new({name: "Morgan", age: 21})
      expect(student).to be_instance_of Student
    end
    it 'has a name' do
      student = Student.new({name: "Morgan", age: 21})
      expect(student.name).to eq "Morgan"
    end
    it 'has an age' do
      student = Student.new({name: "Morgan", age: 21})
      expect(student.age).to eq 21
    end
    it 'has scores' do
      student = Student.new({name: "Morgan", age: 21})
      expect(student.scores).to eq []
    end
  end

  context '#log_score' do
    it 'logs scores for the student' do
      student = Student.new({name: "Morgan", age: 21})
      expected_scores = [100, 87]
      student.log_score(100)
      student.log_score(87)
      expect(student.scores).to eq expected_scores
    end
  end

  context '#grade' do
    it 'averages the scores for the student' do
      student = Student.new({name: "Morgan", age: 21})
      expected_average = 81.5
      student.log_score(76)
      student.log_score(87)
      actual_average = student.grade
      expect(actual_average).to eq expected_average
    end
  end

end
