class PagesController < ApplicationController
  def home
    @now_playing = Tmdb::Movie.now_playing
    @popular = Tmdb::Movie.popular
    @upcoming = Tmdb::Movie.upcoming
    @top_rated = Tmdb::Movie.top_rated
  end

  def about
    @top_rated = Tmdb::Movie.top_rated
    @now_playing = Tmdb::Movie.now_playing
    @popular = Tmdb::Movie.popular
    @movies = Tmdb::Genre.detail(28).results
    for i in 2..50
      @movies += Tmdb::Genre.detail(28).get_page(i).results
    end
    @movies += Tmdb::Genre.detail(12).results
    for i in 2..40
      @movies += Tmdb::Genre.detail(12).get_page(i).results
    end
    @movies += Tmdb::Genre.detail(16).results
    for i in 2..20
      @movies += Tmdb::Genre.detail(16).get_page(i).results
    end
    @movies += Tmdb::Genre.detail(35).results
    for i in 2..20
      @movies += Tmdb::Genre.detail(35).get_page(i).results
    end
    @movies += Tmdb::Genre.detail(14).results
    for i in 2..20
      @movies += Tmdb::Genre.detail(14).get_page(i).results
    end
    @movies += Tmdb::Genre.detail(10749).results
    for i in 2..20
      @movies += Tmdb::Genre.detail(10749).get_page(i).results
    end
    @movies += Tmdb::Genre.detail(18).results
    for i in 2..20
      @movies += Tmdb::Genre.detail(18).get_page(i).results
    end
    @movies += Tmdb::Genre.detail(36).results
    for i in 2..10
      @movies += Tmdb::Genre.detail(36).get_page(i).results
    end
    @movies += Tmdb::Genre.detail(10756).results
    for i in 2..5
      @movies += Tmdb::Genre.detail(10756).get_page(i).results
    end
    @movies += Tmdb::Genre.detail(10748).results
    for i in 2..5
      @movies += Tmdb::Genre.detail(10748).get_page(i).results
    end
    @movies += Tmdb::Genre.detail(10752).results
    for i in 2..5
      @movies += Tmdb::Genre.detail(10752).get_page(i).results
    end
    @movies = @movies.sort_by{|e| -e['popularity']}
  end

  def action
    @movies = Tmdb::Genre.detail(28).results
    for i in 2..20
      @movies += Tmdb::Genre.detail(28).get_page(i).results
    end
    @movies = @movies.sort_by{|e| -e['popularity']}
  end

  def adventure
    @movies = Tmdb::Genre.detail(12).results
    for i in 2..20
      @movies += Tmdb::Genre.detail(12).get_page(i).results
    end
    @movies = @movies.sort_by{|e| -e['popularity']}
  end

  def animation
    @movies = Tmdb::Genre.detail(16).results
    for i in 2..20
      @movies += Tmdb::Genre.detail(16).get_page(i).results
    end
    @movies = @movies.sort_by{|e| -e['popularity']}
  end

  def comedy
    @movies = Tmdb::Genre.detail(35).results
    for i in 2..20
      @movies += Tmdb::Genre.detail(35).get_page(i).results
    end
    @movies = @movies.sort_by{|e| -e['popularity']}
  end

  def documentary
    @movies = Tmdb::Genre.detail(99).results
    for i in 2..5
      @movies += Tmdb::Genre.detail(99).get_page(i).results
    end
    @movies = @movies.sort_by{|e| -e['popularity']}
  end

  def drama
    @movies = Tmdb::Genre.detail(18).results
    for i in 2..20
      @movies += Tmdb::Genre.detail(18).get_page(i).results
    end
    @movies = @movies.sort_by{|e| -e['popularity']}
  end

  def family
    @movies = Tmdb::Genre.detail(10751).results
    for i in 2..20
      @movies += Tmdb::Genre.detail(10751).get_page(i).results
    end
    @movies = @movies.sort_by{|e| -e['popularity']}
  end

  def fantasy
    @movies = Tmdb::Genre.detail(14).results
    for i in 2..20
      @movies += Tmdb::Genre.detail(14).get_page(i).results
    end
    @movies = @movies.sort_by{|e| -e['popularity']}
  end

  def filmnoir
    @movies = Tmdb::Genre.detail(10753).results
    @movies = @movies.sort_by{|e| -e['popularity']}
  end

  def horror
    @movies = Tmdb::Genre.detail(27).results
    for i in 2..20
      @movies += Tmdb::Genre.detail(27).get_page(i).results
    end
    @movies = @movies.sort_by{|e| -e['popularity']}
  end

  def musical
    @movies = Tmdb::Genre.detail(22).results
    for i in 2..3
      @movies += Tmdb::Genre.detail(22).get_page(i).results
    end
    @movies = @movies.sort_by{|e| -e['popularity']}
  end

  def mystery
    @movies = Tmdb::Genre.detail(9648).results
    for i in 2..20
      @movies += Tmdb::Genre.detail(9648).get_page(i).results
    end
    @movies = @movies.sort_by{|e| -e['popularity']}
  end

  def romance
    @movies = Tmdb::Genre.detail(10749).results
    for i in 2..20
      @movies += Tmdb::Genre.detail(10749).get_page(i).results
    end
    @movies = @movies.sort_by{|e| -e['popularity']}
  end

  def scifi
    @movies = Tmdb::Genre.detail(878).results
    for i in 2..20
      @movies += Tmdb::Genre.detail(878).get_page(i).results
    end
    @movies = @movies.sort_by{|e| -e['popularity']}
  end

  def sport
    @movies = Tmdb::Genre.detail(9805).results
    for i in 2..3
      @movies += Tmdb::Genre.detail(9805).get_page(i).results
    end
    @movies = @movies.sort_by{|e| -e['popularity']}
  end

  def test
    @movie = Tmdb::Movie.detail(591)
  end

  def search
    @movie = Tmdb::Movie.find(params[:query])
  end

  def recommendations
    @movie = Movie.all
    movieids = Array.new
    @movie.each do |m|
      movieids.push m.tmdbid
    end
    movieids = movieids.uniq
    movieids.sort!
    @users = User.all
    @myfaves = current_user.movies
    myfavesids = Array.new
    @myfaves.each do |rated|
      myfavesids.push rated.tmdbid
    end

    neighbors = Hash.new
    @haventseen = Array.new

    @users.each do |other|
      if current_user.id == other.id
      else
        @peerfaves = other.movies
        peerfavesids = Array.new
        @peerfaves.each do |prated|
          peerfavesids.push prated.tmdbid
        end
        common = myfavesids & peerfavesids
        @haventseen += (peerfavesids - myfavesids)
        if common.count == 0
          neighbors[other.id] = 0
        else
          numerator = 0
          mydenom = 0
          otherdenom = 0
          common.each do |sharedmovie|
            myrating = current_user.movies.where(tmdbid: sharedmovie).first.rating
            otherrating = other.movies.where(tmdbid: sharedmovie).first.rating
            numerator += (myrating * otherrating)
            mydenom += (myrating * myrating)
            otherdenom += (otherrating * otherrating)
          end
          mydenom = Math.sqrt(mydenom)
          otherdenom = Math.sqrt(otherdenom)
          sim = numerator.to_f / (mydenom * otherdenom)
          neighbors[other.id] = sim
        end
      end
    end

    @movie_predictions = Hash.new
    neighbors = neighbors.sort_by { |neighborid, similarity| similarity }.reverse
    neighbors = Hash[neighbors]
    @haventseen = @haventseen.uniq
    @haventseen.each do |newrec|
      sum = 0
      pool = 0
      neighbors.keys.each do |this_neighbor|
        break if pool >= 5
        neighbor_rating = User.all.where(id: this_neighbor).first.movies.where(tmdbid: newrec).first
        if neighbor_rating.nil?
        else
          sum += neighbor_rating.rating
          pool += 1
        end
      end
      predicted_rating = sum.to_f / pool
      @movie_predictions[newrec] = predicted_rating
    end

    @movie_predictions = @movie_predictions.sort_by { |haventseenmovieid, prediction| prediction}.reverse
    # closestid = neighbors.keys[0]
    # @nn = User.all.where(id: closestid).first


  end
end