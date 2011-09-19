class Main
  helpers do
    # cookie helpers
    def eat_cookie name
      request.cookies[name]
    end

    def bake_cookie name, content, opts={}
      response.set_cookie name, {:value => content, :domain => request.host, :expires => 3.days.from_now}
    end
    
    def eat_hash_cookie name, key=:all
      return unless hash_cookie = request.cookies[name]
    end
    
    def bake_hash_cookie name, hash
      response.set_cookie name, hash
    end

    private
      def unprefixed_path_to(obj)
        Class == obj.class ? (obj.to_s.demodulize.downcase.pluralize) : (obj.class.to_s.demodulize.downcase + '/' + obj.id)
      end
  end
end