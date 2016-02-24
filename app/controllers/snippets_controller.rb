class SnippetsController < ApplicationController
  before_action :user_authenticate, except: [:index]

  def index
    @snippets = Snippet.all
    @kinds = Kind.all
  end

  def new
    @snippet = Snippet.new
  end

  def create
    @snippet = Snippet.new(snippet_params)
    @snippet.user = current_user
    if @snippet.save
      redirect_to root_path, notice: "Your snippet has been created!"
    else
      flash[:alert] = "Your snippet wasn't created!"
      render :new
    end
  end

  def show
    @snippet = Snippet.find params[:id]
  end


  def edit
    @snippet = Snippet.find params[:id]
  end

  def update
    @snippet = Snippet.find params[:id]
    if @snippet.update(snippet_params)
      redirect_to root_path, notice: "Your Snippet has been updated"
    else
      flash[:alert] = "You have failed to update your snippet!"
      render :edit
    end
  end

  def destroy
    @snippet = Snippet.find params[:id]
    @snippet.destroy
    redirect_to root_path, notice: "Your snippet has been removed!"
  end

  private

  def snippet_params
    snippet_params = params.require(:snippet).permit(:title, :body, :kind_id)
  end
end
