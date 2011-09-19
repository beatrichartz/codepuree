class Main
    
  get "/works/?" do
    slim :works
  end
  
  get "/work/:id" do
    @work = Work[params[:id]]
    slim :work
  end

end