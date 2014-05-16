# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
Movie.delete_all

# arr = Array.new

# File.open("#{Rails.root}/lib/data/ids.txt") do |f|
# 	lines = f.lines
# 	lines.each do |line|
# 		arr.push line.to_i
# 	end
# end

# arr = arr.uniq

# for i in 1..9
# 	puts i
# 	path = "#{Rails.root}/lib/data/training_set/mv_000000%s.txt" % i.to_s
# 	File.open(path) do |f|
# 		lines = f.lines
# 		tmdbid = lines.first.chomp.split(":")[0]
# 		tmdbid = tmdbid.to_i
# 		tmdbid = arr[i - 1]
# 		lines.next
# 		emailbase = "netflixuser"
# 		emaildomain = "@example.com"
# 		lines.each do |line|
# 			id, rating, date = line.chomp.split(",")
# 			id = id.to_i
# 			rating = rating.to_i
# 			user = User.find_by_id(id)
# 			if user.nil?
# 				email = emailbase + id.to_s + emaildomain
# 				user = User.create!(:email => email, :password => "netflixuser", :id => id)
# 				Movie.create!(:user_id => id, :tmdbid => tmdbid, :rating => rating)
# 			else
# 				Movie.create!(:user_id => id, :tmdbid => tmdbid, :rating => rating)
# 			end
# 		end
# 	end
# end

# path = "#{Rails.root}/lib/data/training_set/mv_0000009.txt"
# File.open(path) do |f|
# 	lines = f.lines
# 	tmdbid = lines.first.chomp.split(":")[0]
# 	tmdbid = tmdbid.to_i
# 	tmdbid = arr[i - 1]
# 	lines.next
# 	emailbase = "netflixuser"
# 	emaildomain = "@example.com"
# 	lines.each do |line|
# 		id, rating, date = line.chomp.split(",")
# 		id = id.to_i
# 		rating = rating.to_i
# 		user = User.find_by_id(id)
# 		if user.nil?
# 			email = emailbase + id.to_s + emaildomain
# 			user = User.create!(:email => email, :password => "netflixuser", :id => id)
# 			Movie.create!(:user_id => id, :tmdbid => tmdbid, :rating => rating)
# 		else
# 			Movie.create!(:user_id => id, :tmdbid => tmdbid, :rating => rating)
# 		end
# 	end
# end

# for i in 10..20
# 	puts i
# 	path = "#{Rails.root}/lib/data/training_set/mv_00000%s.txt" % i.to_s
# 	File.open(path) do |f|
# 		lines = f.lines
# 		tmdbid = lines.first.chomp.split(":")[0]
# 		tmdbid = tmdbid.to_i
# 		tmdbid = arr[i - 1]
# 		lines.next
# 		emailbase = "netflixuser"
# 		emaildomain = "@example.com"
# 		lines.each do |line|
# 			id, rating, date = line.chomp.split(",")
# 			id = id.to_i
# 			rating = rating.to_i
# 			user = User.find_by_id(id)
# 			if user.nil?
# 				email = emailbase + id.to_s + emaildomain
# 				user = User.create!(:email => email, :password => "netflixuser", :id => id)
# 				Movie.create!(:user_id => id, :tmdbid => tmdbid, :rating => rating)
# 			else
# 				Movie.create!(:user_id => id, :tmdbid => tmdbid, :rating => rating)
# 			end
# 		end
# 	end
# end
# for i in 10..99
# 	puts i
# 	path = "#{Rails.root}/lib/data/training_set/mv_00000%s.txt" % i.to_s
# 	File.open(path) do |f|
# 		lines = f.lines
# 		tmdbid = lines.first.chomp.split(":")[0]
# 		tmdbid = tmdbid.to_i
# 		tmdbid = arr[i - 1]
# 		lines.next
# 		emailbase = "netflixuser"
# 		emaildomain = "@example.com"
# 		lines.each do |line|
# 			id, rating, date = line.chomp.split(",")
# 			id = id.to_i
# 			rating = rating.to_i
# 			user = User.find_by_id(id)
# 			if user.nil?
# 				email = emailbase + id.to_s + emaildomain
# 				user = User.create!(:email => email, :password => "netflixuser", :id => id)
# 				Movie.create!(:user_id => id, :tmdbid => tmdbid, :rating => rating)
# 			else
# 				Movie.create!(:user_id => id, :tmdbid => tmdbid, :rating => rating)
# 			end
# 		end
# 	end
# end
# for i in 100..999
# 	puts i
# 	path = "#{Rails.root}/lib/data/training_set/mv_0000%s.txt" % i.to_s
# 	File.open(path) do |f|
# 		lines = f.lines
# 		tmdbid = lines.first.chomp.split(":")[0]
# 		tmdbid = tmdbid.to_i
# 		tmdbid = arr[i - 1]
# 		lines.next
# 		emailbase = "netflixuser"
# 		emaildomain = "@example.com"
# 		lines.each do |line|
# 			id, rating, date = line.chomp.split(",")
# 			id = id.to_i
# 			rating = rating.to_i
# 			user = User.find_by_id(id)
# 			if user.nil?
# 				email = emailbase + id.to_s + emaildomain
# 				user = User.create!(:email => email, :password => "netflixuser", :id => id)
# 				Movie.create!(:user_id => id, :tmdbid => tmdbid, :rating => rating)
# 			else
# 				Movie.create!(:user_id => id, :tmdbid => tmdbid, :rating => rating)
# 			end
# 		end
# 	end
# end
# for i in 1000..(arr.count - 1)
# 	puts i
# 	path = "#{Rails.root}/lib/data/training_set/mv_000%s.txt" % i.to_s
# 	File.open(path) do |f|
# 		lines = f.lines
# 		tmdbid = lines.first.chomp.split(":")[0]
# 		tmdbid = tmdbid.to_i
# 		tmdbid = arr[i - 1]
# 		lines.next
# 		emailbase = "netflixuser"
# 		emaildomain = "@example.com"
# 		lines.each do |line|
# 			id, rating, date = line.chomp.split(",")
# 			id = id.to_i
# 			rating = rating.to_i
# 			user = User.find_by_id(id)
# 			if user.nil?
# 				email = emailbase + id.to_s + emaildomain
# 				user = User.create!(:email => email, :password => "netflixuser", :id => id)
# 				Movie.create!(:user_id => id, :tmdbid => tmdbid, :rating => rating)
# 			else
# 				Movie.create!(:user_id => id, :tmdbid => tmdbid, :rating => rating)
# 			end
# 		end
# 	end
# end