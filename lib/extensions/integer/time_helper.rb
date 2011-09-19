module TimeHelper
  
  def days
    self * 86400
  end
  alias day days
  
  def weeks
    self * 604800
  end
  alias week weeks
  
  def from_now
    Time.now + self
  end
  
  def ago
    Time.now - self
  end
  
end

Integer.send :include, TimeHelper