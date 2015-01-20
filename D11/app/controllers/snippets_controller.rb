class SnippetsController < ApplicationController

  def index
    @snippets = Snippet.all
    @char_limit = 75
  end

  def show
    @snippet = Snippet.find params[:id]
  end

  def new
    @snippet = Snippet.new
  end

  def create
    @snippet = Snippet.create snippet_params
    redirect_to snippets_path
  end

  def snippet_params
    params.require(:snippet).permit(:title,:desc,:code)
  end
  
end
