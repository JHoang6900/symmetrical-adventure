class PortfoliosController < ApplicationController
    before_action :set_portoflio_item, only: [:edit, :show, :destroy, :update]
  layout 'portfolio'
    access all: [:show, :index, :angular], user: {except: [:destroy, :new, :creat, :update, :edit]}, site_admin: :all
  def index
    @portfolio_items = Portfolio.all
    
  end
    def angular
          @angular_portfolio_items = Portfolio.angular
  
    end
  
  def new 
    @portfolio_item = Portfolio.new
    3.times { @portfolio_item.technologies.build }
  end

def create
  @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Your portfolio item is now live!' }
      else
        format.html { render :new }
      end
    end
end
  
  def edit
    @portfolio_item = Portfolio.find(params[:id])
  end

  def update
      @portfolio_item = Portfolio.find(params[:id])
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'The record was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
          3.times { @portfolio_item.technologies.build }  

      end
    end
  end
  
  def show
    @portfolio_item = Portfolio.find(params[:id])
  end
  
  def destroy
    # Perform the lookup
    @portfolio_item = Portfolio.find(params[:id])
    # Destroy/delete the record
    @portfolio_item.destroy
        
    #Redirect to new page
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Record was removed.' }
    end
  end
  
  private 
  
  def portfolio_params
    params.require(:portfolio).permit(
                                      :title, 
                                      :subtitle, 
                                      :body,
                                      technologies_attributes: [:name]
                                      )
  end
  
  def set_portoflio_item
        @portfolio_item = Portfolio.find(params[:id])
  end
    
end