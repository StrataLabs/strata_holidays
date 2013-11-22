module CommentsHelper
  def nested_comments(comments)
    comments.all.map do |comment, sub_comments|
      content_tag(:div, :class => "media") do
        render :partial => 'comments/comment', :locals => {:comment => comment}
      end
    end.join.html_safe
  end
end