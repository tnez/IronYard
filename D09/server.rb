require 'sinatra'
require 'data_mapper'

DataMapper.setup(:default,
                 'mysql://root@localhost/blog')

DataMapper.finalize.auto_upgrade!

get '/' do
  erb :index
end
