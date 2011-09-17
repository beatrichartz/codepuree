class Main
  helpers do

    # Your helpers go here. You can also create another file in app/helpers with the same format.
    # All helpers defined here will be available across all the application.
    #
    # @example A helper method for date formatting.
    #
    #   def format_date(date, format = "%d/%m/%Y")
    #     date.strftime(format)
    #   end

    # Generate HAML and escape HTML by default.
    def haml(template, options = {}, locals = {})
      options[:escape_html] = true unless options.include?(:escape_html)
      super(template, options, locals)
    end

    # Render a partial and pass local variables.
    #
    # Example:
    #   != partial :games, :players => @players
    def partial(template, locals = {})
      haml(:"_#{template}", {:layout => false}, locals)
    end
    
    def t(*args)
      I18n.t(*args)
    end
    
    def path_to(obj)
      '/' + unprefixed_path_to(obj)
    end
    
    def url_to(obj)
      'http://' + request.env["HTTP_HOST"] + '/' + unprefixed_path_to(obj)
    end
    
    private
      def unprefixed_path_to(obj)
        Class == obj.class ? (obj.to_s.demodulize.downcase + 's/') : (obj.class.to_s.demodulize.downcase + '/' + obj.id)
      end
  end
end
