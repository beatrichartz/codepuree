module Mixins
  module Routes
    module Restful
      def restful(name, opts={})
        singular_name  = name.to_s.singularize
        resource_class = opts[:resource_name] || singular_name.capitalize.constantize
      
        routes         = opts[:routes]  || {}
        index          = routes[:index] || "/#{name}/?"
        show           = routes[:show]  || "/#{name}/:id"
        edit           = routes[:edit]  || "/#{name}/edit/:id"
        new            = routes[:new]   || "/#{name}/new/?"
        update         = routes[:update] || "/#{name}/update/:id"
        create         = routes[:create] || "/#{name}/create/?"
        delete         = routes[:delete] || "/#{name}/delete/:id"
        
        actions = [:index, :show, :edit, :new, :update, :create, :delete]
        actions = actions & Array(opts[:only]) if opts[:only]
        actions = actions - Array(opts[:except]) if opts[:except]
        
        get new do
          slim :"#{name}/new"
        end
        
        post update do
        end

        put create do
        end
        
        delete delete do
        end
        
        get index do
          slim :"#{name}/index"
        end
        
        get edit do
          find_and_render :"#{name}/edit"
        end

        get show do
          find_and_render :"#{name}/show"
        end
                
        define_method :find_and_render do |tmpl|
          instance_variable_set("@#{singular_name}", resource_class[params[:id]])
          unless instance_variable_get("@#{singular_name}")
            slim :"404"
          else 
            slim tmpl
          end
        end
        
      end
    end
  end
end