require_relative 'person'
require_relative 'classroom'

class Student < Person
  attr_accessor :classroom

  def initialize(age, classroom: 'math', parent_permission: true, name: 'Unknown')
    super(age, name: name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end

  def add_classroom(classroom)
    classroom.student.push(self) unless classroom.student.include?(self)
  end
end
