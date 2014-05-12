class SearchesController < ApplicationController


  def index
    @search = Search.all
  end

  def show

  end

  def new



    if current_user
      @new_search = Search.new(input: params[:auto], user_id: current_user.id)
      @new_search.save

    else
      redirect_to :root

    end


    respond_to do |format|
      format.html { redirect_to '/' }
      format.js {  }
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
