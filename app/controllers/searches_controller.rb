class SearchesController < ApplicationController

  def index

  end

  def show
    @search = Search.find(params[:id])
  end

  #saves searches only if a user is signed in
  def new
    if current_user
      @new_seach = Search.find_or_create_by(input: params[:auto], user_id: current_user.id)
      respond_to do |format|
        format.html {redirect_to :root}
        format.js {}
      end
    else
      respond_to do |format|
        format.html {redirect_to :root}
        format.js {} 
      end
    end
  end

  def destroy
    @search = Search.destroy(params[:id])

    respond_to do |format|
      format.html { redirect_to '/' }
      format.js {  }
    end
  end
end


