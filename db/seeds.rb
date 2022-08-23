beers = PunkApi::Beers.new.get
beers.each do |beer|
  Beer.find_or_create_by({name: beer["name"], description: beer["description"]})
end
