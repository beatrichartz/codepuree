class Main
  get "/" do
    @redis = monk_settings(:redis)
    @works = Work.all
    haml :home
  end
  
  get "/works/?" do
    @redis = monk_settings(:redis)
    @works = Work.all
    haml :works
  end
  
  get "/work/:id" do
    @works = Work.all
    @work = Work[params[:id]]
    haml :work
  end
end
