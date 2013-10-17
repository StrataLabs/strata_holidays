class CommentsController < ApplicationController
  before_filter :confirm_user_type!
  def new
    @parent_id = params.delete(:parent_id)
    @commentable = find_commentable
    @comment = Comment.new( :parent_id => @parent_id,
                            :commentable_id => @commentable.id,
                            :commentable_type => @commentable.class.to_s)
  end

  def create
    @commentable = find_commentable
    # allow_comments_params(comment_params)
    @index = params[:index]
    @comment = @commentable.comments.build(params.require(:comment).permit(:parent_id, :content))
    if @comment.save
      @comments = @commentable.comments
      flash[:notice] = "Successfully created comment."
      #redirect_to @commentable
    else
      flash[:error] = "Error adding comment."
    end
    respond_to do |format|
      format.js
      format.xml {render :xml => @commentable.to_xml , :status => :ok}
    end
  end

  def confirm_user_type!
    if current_user
      if current_user.user_type == User::VC
        respond_to do |format|
          format.html {redirect_to user_unwinders_path}
          format.xml
        end
      end
    else
      respond_to do |format|
        format.html {redirect_to user_session_path}
        format.xml
      end
    end
  end

  private
  def find_commentable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end
end