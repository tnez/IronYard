require 'sinatra'
require 'data_mapper'

DataMapper.setup(:default,
                 'mysql://root@localhost/blog')

get '/' do
  erb :index
end
