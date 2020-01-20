class Question
  def initialize(text:, options:)
    @text = text
    @options = options
  end

  def to_s
    @text
  end

  def options
    @options
  end

  def option(i)
    @options[i]
  end
end
