module Inflections
  def demodulize
    self.gsub(/^.*::/, '')
  end
  def demodulize!
    self.gsub!(/^.*::/, '')
  end
end

String.send :include, Inflections