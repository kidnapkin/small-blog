module CommentsHelper
  def nested_comments(comments)
    safe_join(comments.map do |comment, sub_comment|
      render(comment) + content_tag(:div, nested_comments(sub_comment), class: 'nested_comments')
    end)
  end
end