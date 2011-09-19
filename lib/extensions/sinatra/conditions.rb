module Sinatra
  class Base
    private
    
    def self.exclude(paths)
      condition do
        !request.path.match(paths)
      end
    end
  end
end