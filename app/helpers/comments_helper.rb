module CommentsHelper
  def nested_comments(comments)
    comments.all.map do |comment, sub_comments|
      content_tag(:div, render(comment), :class => "media")
    end.join.html_safe
  end
end