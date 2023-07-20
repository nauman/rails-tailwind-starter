class Blog::ArticlesController < ApplicationController

  def index
    @q = Article.ransack(params[:q])
    @pagy, @articles = pagy(@q.result.order(created_at: :desc), items: 4)
  end

  def show
    @article = Article.friendly.find(params[:slug])
  end

end
