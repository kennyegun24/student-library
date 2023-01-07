require_relative 'decorator'

class TrimDecorator < Decorator
  def correct_name
    @nameable.correct_name[0...10].to_s
  end
end
