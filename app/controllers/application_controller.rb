class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  get '/' do
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/new' do
    erb :new
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by(id: params[:id])
    erb :edit
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by(id: params[:id])
    erb :show
  end

  post '/recipes' do
    recipe = Recipe.create(params)
    redirect "/recipes/#{recipe.id}"
  end

  patch '/recipes/:id' do
    recipe = Recipe.find_by(id: params[:id])
    # binding.pry
    recipe.update(params[recipe])
    redirect "/recipes/#{recipe.id}"
  end

  delete '/recipes/:id' do
    recipe = Recipe.find_by(id: params[:id])
    recipe.destroy
    redirect "/recipes"
  end


end
