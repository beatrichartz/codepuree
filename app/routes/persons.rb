class Main
    
  get "/people/?" do
    slim :people
  end
  
  get "/person/:id" do
    @work = Person[params[:id]]
    slim :person
  end

end