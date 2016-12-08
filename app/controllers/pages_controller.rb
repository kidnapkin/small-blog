class PagesController < ApplicationController
  def home
    @posts = Post.order(created_at: :desc).paginate(page: params[:page])
  end

  def about
  end

  def contact
  end
end
