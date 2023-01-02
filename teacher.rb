class Teacher < Person
  def initialize(name: 'Unknown', age: 0, parent_permission: true, specialization: 'Unknown')
    super(name: name, age: age, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
