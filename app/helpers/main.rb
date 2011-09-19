class Main
  helpers do
    # Generate SLIM and escape HTML by default.
    def slim(template, options = {}, locals = {})
      options[:escape_html] = true unless options.include?(:escape_html)
      super(template, options, locals)
    end

    # Render a partial and pass local variables.
    def partial(template, locals = {})
      slim(:"_#{template}", {:layout => false}, locals)
    end
    
    # internationalization made simple
    def t(*args)
      I18n.t(*args)
    end
  end
end
