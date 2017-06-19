class PortfoliosController < ApplicationController
  def index
    @portfolio_items = Portfolio.all
  end
  
  def new 
    @portfolio_item = Portfolio.new
end
def create
    @blog = Portfolio.new( params.require(:portfolio).permit(:title, :subtitle, :body))

    respond_to do |format|
      if @blog.save
        format.html { redirect_to portfolios_path, notice: 'Your portfolio item is now live!' }
      else
        format.html { render :new }
      end
    end
  end
end


