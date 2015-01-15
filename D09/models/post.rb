require 'data_mapper'

class Post

  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :body, Text

end
