require_relative './name_decorator'

class TrimeName < NameDecorator
  def correct_name
    nameable.correct_name[0, 10]
  end
end
