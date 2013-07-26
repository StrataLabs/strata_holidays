require 'active_support/concern'

module Commentable
  extend ActiveSupport::Concern

  included do
    before_filter :comments, :only => [:show]
  end

  def comments
    p params
    @commentable = find_commentable
    @comments = @commentable.comments(:order => :created_at)
    @comment = Comment.new
  end

  private

  def find_commentable
    return params[:controller].singularize.classify.constantize.find(params[:id])
  end

end