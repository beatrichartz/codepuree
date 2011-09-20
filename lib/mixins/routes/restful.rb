module Mixins
  module Routes
    module Restful
      def restful(name, opts={})
        resource_class = opts[:resource_name] || name.to_s.capitalize.constantize
        singular_name  = name.to_s.singularize
      
        routes         = opts[:routes]  || {}
        index          = routes[:index] || "/#{name}/?"
        show           = routes[:show]  || "/#{name}/:id"
        edit           = routes[:edit]  || "/#{name}/edit/:id"
        new            = routes[:new]   || "/#{name}/new/?"
        update         = routes[:update] || "/persons/update/:id"
        create         = routes[:create] || "/persons/create/?"
        delete         = routes[:delete] || "/persons/delete/:id"
        
        actions = [:index, :show, :edit, :new, :update, :create, :delete]
        actions = actions & Array(opts[:only]) if opts[:only]
        actions = actions - Array(opts[:except]) if opts[:except]
        
        get index do
          slim :"#{name}/index"
        end

        get show do
          instance_variable_set("@{singular_name}", resource_class[params[:id]])
          slim :"#{name}/show"
        end

        get edit do
          instance_variable_set("@{singular_name}", resource_class[params[:id]])
          slim :"#{name}/edit"
        end
        
        get new do
          slim :"#{name}/new"
        end

        post update do
        end

        put create do
        end
        
      end
    end
  end
end