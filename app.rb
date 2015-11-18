#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:lepra.db"

class Post < ActiveRecord::Base 
	validates :name, presence: true
	validates :content, presence: true
end

class Comment < ActiveRecord::Base 
	validates :name, presence: true
	validates :comment, presence: true
end


get '/' do

	erb :index			
end

get '/new' do
	@c = Post.new
	erb :new	
end

post '/new' do
	@c = Post.new params[:content]

		if @c.save 
			return erb :new	
		else
			@error = @c.errors.full_messages.first
			erb :new
		end	
end

# get '/details/:post_id' do
# 	post_id = params[:post_id]

# 	result = @db.execute 'select * from Posts where id =?', [post_id]
# 	@row = result[0]

# 	@comments = @db.execute 'select * from Comments where post_id = ? order by id', [post_id]


# 	erb :details
# end

# post '/details/:post_id' do
# 	# post_id = params[:post_id]
# 	# content = params[:content]
# 	# username = params[:username]

				
# 	# 	@db.execute 'insert into Comments (content, created_date, username, post_id) 
# 	# 				 values (?, ?, datetime(), ?)', [content, username, post_id]

# 	# 	redirect to('/details/' + post_id)
# end