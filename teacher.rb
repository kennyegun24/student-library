class Teacher < Person
  attr_accessor :specialization

  def initialize(specialization)
    super('Kenny Egun', 21)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
