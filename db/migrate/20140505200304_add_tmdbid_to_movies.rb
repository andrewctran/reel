class AddTmdbidToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :tmdbid, :integer
  end
end
