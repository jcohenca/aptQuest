class SearchesController < ApplicationController


  def index
    @response = Search.yelp_search
  end

  def show

  end

  def new
    if current_user
      @new_search = Search.new(input: params[:auto], user_id: current_user.id)
      @new_search.save
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


