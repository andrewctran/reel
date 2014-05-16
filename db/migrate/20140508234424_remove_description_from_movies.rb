class RemoveDescriptionFromMovies < ActiveRecord::Migration
  def change
    remove_column :movies, :description, :string
  end
end
