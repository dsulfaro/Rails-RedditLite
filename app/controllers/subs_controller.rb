class SubsController < ApplicationController
  before_action :require_login, only: [:new, :edit, :create, :update]
  def index
    @subs = Sub.order(:title)
  end

  def show
    @sub = Sub.find_by(id: params[:id])
    unless @sub
      flash[:errors] = ["404 page not found either...."]
      redirect_to subs_url
    end
    render :show
  end

  def new
    @sub = Sub.new
    render :new
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.user_id = current_user.id
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash[:errors] = @sub.errors.full_messages
      redirect_to new_sub_url
    end
  end

  def edit
    @sub = Sub.find_by(id: params[:id])
    if @sub
      if current_user == @sub.moderator
        render :edit
      else
        flash[:errors] = ["You. shall not. PASS!"]
        redirect_to sub_url(@sub)
      end
    else
      flash[:errors] = ["404 page not found either...."]
      redirect_to subs_url
    end
  end

  def update
    @sub = Sub.find_by(id: params[:id])
    if @sub
      if current_user == @sub.moderator
        # render :edit
        if @sub.update(sub_params)
        else
          flash[:errors] = @sub.errors.full_messages
        end
        redirect_to sub_url(@sub)
      else
        flash[:errors] = ["You. shall not. PASS!"]
        redirect_to sub_url(@sub)
      end
    else
      flash[:errors] = ["404 page not found either...."]
      redirect_to subs_url
    end
  end

  # def destroy
  # end

  private

  def sub_params
    params.require(:sub).permit(:title, :description, :user_id)
  end

end
