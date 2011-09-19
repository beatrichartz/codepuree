class Main
  extend Mixins::Routes::CodepureeBeforeFilters
  codepuree_before_filters
  
  get "/" do
    slim :home
  end
  
  get "/competences/?" do
    slim :competences
  end
  
  get "/contact/?" do
    slim :contact
  end

end
