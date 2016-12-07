module PostsHelper
  def short_description(post, length)
    truncate(strip_tags(post.content), length: length)
  end
end
