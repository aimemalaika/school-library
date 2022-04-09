require_relative './name_decorator'

class CapitalizeName < NameDecorator
  def correct_name
    nameable.correct_name.capitalize
  end
end
