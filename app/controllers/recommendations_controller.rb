class RecommendationsController < ApplicationController
	def index
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

		@users.each do |other|
			if current_user.id == other.id
			else
				@peerfaves = other.movies
				peerfavesids = Array.new
				@peerfaves.each do |prated|
					peerfavesids.push prated.tmdbid
				end
				common = myfavesids & peerfavesids
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

		neighbors = neighbors.sort_by { |neighborid, similarity| similarity }.reverse
		neighbors = Hash[neighbors]

		closestid = neighbors.keys[0]
		@nn = User.all.where(id: closestid).first
	end
end