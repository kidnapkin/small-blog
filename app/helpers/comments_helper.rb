module CommentsHelper
  def nested_comments(comments)
    safe_join(comments.map do |comment, sub_comment|
      render(comment).html_safe + content_tag(:div, nested_comments(sub_comment).html_safe, class: 'nested_comments')
    end)
  end
end
