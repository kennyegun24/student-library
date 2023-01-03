require_relative 'decorator'

class CapDecorator < Decorator
  def correct_name
    @nameable.correct_name.capitalize.to_s
  end
end
