rails new Newapp -T —database=postgresql
cd into Newapp dir
bundle
rails g controller recommendnchill index
rails g resource movie title:string

rake db:create
rake db:migrate


Movie.create(title: ‘movie1’)
Movie.create(title: ‘movie2’)
Movie.create(title: ‘movie3’)

rake db:seed

atom go to config > routes
root to: 'movie#index'

add 'angularjs-rails' to Gemfile
bundle
go to app/assets/javascripts/application.js and require angularjs-rails and angular-resource (e.g. //= require angular)
create app.js in app/assets/javascripts folder, add the code to create angular module inside it, and inject 'ngResource' into it aswell
go to views > layouts > application.html.erb, add ng-app to html element

Since page app is now ready.

Rails API:

 Add following to config > routes.rb:
 ```   scope :api do
 resources :movies, defaults: {format: :json}
 end
 ```

moviecontroller.rb:
```
respond_to :json

  def index
    render :json => Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
    respond_to do |format|

      format.html # show.html.erb
      format.json { render json: @user }

    end
  end

  def create
    respond_with Movie.create(title_params)
  end


  def destroy
    respond_with Movie.destroy(params[:id])
  end

  private

  def title_params
    params.require(:movie).permit(:title)
  end
end
```
