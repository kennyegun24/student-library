class Student < Person
  def initialize(name: 'Unknown', age: 0, parent_permission: true, classroom: 'Unknown')
    super(name: name, age: age, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
