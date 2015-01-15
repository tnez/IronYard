require 'sinatra'
require 'data_mapper'
require './models/post.rb'

DataMapper.setup(:default,
                 'mysql://root@localhost/blog')

DataMapper.finalize.auto_upgrade!

# Show
get '/' do
  @posts = Post.all
  erb :index
end

# View single post
get '/post/:id' do
  @post = Post.get params[:id]
  erb :indiv_post
end

# New
get '/create_post' do
  erb :create_post_form
end

# Create
post '/create_post' do
  p params
  @post = Post.new
  @post.title = params[:title]
  @post.body = params[:body]
  @post.save
  redirect to '/'
end

# Edit
get '/edit_post/:id' do
  @post = Post.get params[:id]
  erb :edit_post_form
end

put '/edit_post/:id' do
  @post = Post.get params[:id]
  @post.title = params[:title]
  @post.body = params[:body]
  @post.save
  redirect to '/'
end
