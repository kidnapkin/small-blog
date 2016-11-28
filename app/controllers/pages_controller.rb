class PagesController < ApplicationController
  def home
    @posts = Post.order(created_at: :desc)
  end

  def help
  end

  def about
  end

  def contact
  end
end
