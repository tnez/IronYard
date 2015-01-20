class SnippetsController < ApplicationController

  def index
    @snippets = Snippet.all
    @char_limit = 75
  end
  
end
