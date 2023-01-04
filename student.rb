require_relative 'person'
require_relative 'teacher'
require_relative 'classroom'
require_relative 'book'

class Student < Person
  attr_accessor :classroom

  def initialize(classroom)
    super('kenny', 10)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def classrooms=(classroom)
    @classroom = classroom
    classroom.students.push(self)
  end
end
