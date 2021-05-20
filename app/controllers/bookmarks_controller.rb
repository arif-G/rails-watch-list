class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
    @bookmark.list = List.find(params[:list_id])
  end

  def create
    # raise
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      @new_bookmark = Bookmark.new
      render 'lists/show'
    end
  end

  def destroy

    @bookmark = Bookmark.find(params[:id])
    @list = @bookmark.list
    @bookmark.destroy

    redirect_to list_path(@list)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end
end
