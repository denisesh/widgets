class WidgetsController < ApplicationController
  def index
    @widgets = Widget.all
  end

  def new
    @widget = Widget.new
  end

  def create
    @widget = Widget.new(params.require(:widget).permit(:name, :description, :age))
    @widget.save
    redirect_to root_path
  end

  def edit
    @widget = Widget.find(params[:id])
  end

  def update
    @widget = Widget.find(params[:id])
    #Widget.update(params[widget[:id]]) johns code in doctor example not working
    if
      @widget.update(params.require(:widget).permit(:name, :description, :age))
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    @widget = Widget.find(params[:id])
  end

  def destroy
    @widget = Widget.find(params[:id])
    @widget.destroy
    redirect_to widgets_path
  end

end
