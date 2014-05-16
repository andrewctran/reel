class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:show, :new, :index, :edit, :create, :update, :destroy]

  def index
    @movies = Movie.all
  end

  def show
    @film = Tmdb::Movie.detail(@movie.tmdbid)
  end

  def new
    @id = params[:id]
    @film = Tmdb::Movie.detail(@id)
    @movie = current_user.movies.build(:tmdbid => @id)
  end

  def edit
    @film = Tmdb::Movie.detail(@movie.tmdbid)
  end

  def create
    @movie = current_user.movies.build(movie_params)

    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
        format.json { render action: 'show', status: :created, location: @movie }
      else
        format.html { render action: 'new' }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    def correct_user
      @movie = current_user.movies.find_by(id: params[:id])
      redirect_to movies_path if @movie.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_params
      params.require(:movie).permit(:rating, :tmdbid)
    end
end
