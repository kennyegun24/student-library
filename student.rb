require_relative 'person'
require_relative 'teacher'
require_relative 'classroom'
require_relative 'book'

class Student < Person
  attr_reader :classroom

  def initialize(classroom, age, name = 'Unknown', parent_permission: true)
    super(name, age, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
