class PostsController < ApplicationController
  def index
    @posts = Post.all
    respond_to do |format|
      format.html
      format.csv do
        filename = ['Posts', Date.today.to_s].join(' ')
        send_data Post.to_csv(@posts), filename:, content_type: 'text/csv'
      end
    end
  end
end
