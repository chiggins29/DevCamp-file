class PortfoliosController < ApplicationController
  layout 'portfolio'

  before_action :set_portfolio, only: [:edit, :update, :show, :destroy]
	
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
        format.html { redirect_to portfolios_path, notice: 'Your portfolio item is now live.' }
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
        format.html { redirect_to portfolios_path, notice: 'The recond was successfully updated' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
  	@portfolio_item = Portfolio.find(params[:id])
  end

  def destroy
    #performs the look up
  	
    # deletes the file
  	@portfolio_item.destroy
    #redirects back to portfolip page
    respond_to do |format|
      format.html { redirect_to  portfolios_url, notice: 'record was successfully destroyed.' }
  end
end

  def set_portfolio
    @portfolio_item = Portfolio.find(params[:id])
  end
  private

  def portfolio_params
    params.require(:portfolio).permit(:title, 
                                      :subtitle, 
                                      :body, 
                                      technologies_attributes: [:name]
                                      )
  end
end