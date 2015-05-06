class TagsController < ApplicationController
  before_action :require_user, only: [:new, :create]
  before_action :require_admin, only: [:new, :create]

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      flash[:notice] = 'Tag has been created'
      redirect_to root_url
    else
      render :new
    end
  end

  def show
    @tag = Tag.find_by slug: params[:id]
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end
