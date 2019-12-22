class MeowsController < ApplicationController
  def index
    @meows = Meow.all
  end

  def show
  end

  def new
    @meow = Meow.new
  end

  def create
    @meow = Meow.new(params.require(:meow).permit(:body))
    if @meow.save
      redirect_to root_path
    else
      render :new
    end
  end
end
