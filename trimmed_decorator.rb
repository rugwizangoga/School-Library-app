require './decorator'

class TrimmerDecorator < Decorator
  MAX_NAME_LENGTH = 10

  def correct_name
    super[0, MAX_NAME_LENGTH]
  end
end
