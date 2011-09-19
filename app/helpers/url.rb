class Main
  helpers do
    # url helpers
    def path_to(obj)
      '/' + unprefixed_path_to(obj)
    end

    def url_to(obj, opts={})
      urlto = url(unprefixed_path_to(obj))
      urlto += opts.to_a.flatten.inject('?') do |string, part| 
        @cycle = @cycle ? false : true
        string += string == '?' ? part.to_s : ({false => '=', true => '&'}[@cycle] + part.to_s) 
      end unless opts.empty?
      urlto
    end

    private
      def unprefixed_path_to(obj)
        Class == obj.class ? (obj.to_s.demodulize.downcase.pluralize) : (obj.class.to_s.demodulize.downcase + '/' + obj.id)
      end
  end
end