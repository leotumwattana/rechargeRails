class CardHoldersController < ApplicationController
  skip_before_filter  :verify_authenticity_token


  def new
  end

  def create
    cardholder_attributes = params.require(:cardholder).permit(:name, :email, :deviceToken)
    @cardHolder = CardHolder.new(cardholder_attributes)
    @cardHolder.currentCharge = 0
    @cardHolder.inside = false
    if @cardHolder.save
      render :json => { } # send back any data if necessary
    else
      render :json => { }, :status => 500
    end
  end

  def getcharge
    deviceToken = params[:deviceToken]
    cardHolder = CardHolder.find_by(deviceToken: deviceToken)
    a = cardHolder.currentCharge
    render json: a
  end


  def inside
    deviceToken = params[:deviceToken]
    cardholder_attributes = params.require(:cardholder).permit(:status, :deviceToken)
    cardHolder = CardHolder.find_by(deviceToken: deviceToken)
    cardHolder.inside = true
    if cardHolder.save
      render :json => { } # send back any data if necessary
    else
      render :json => { }, :status => 500
    end
  end

  def outside
    deviceToken = params[:deviceToken]
    cardholder_attributes = params.require(:cardholder).permit(:status, :deviceToken)
    cardHolder = CardHolder.find_by(deviceToken: deviceToken)
    cardHolder.inside = false
    if cardHolder.save
      render :json => { } # send back any data if necessary
    else
      render :json => { }, :status => 500
    end
  end

  def show
    @cardHolder = CardHolder.find(params[:id])
    render :show
  end

  def index
    @cardHolders = CardHolder.where(inside: true)
    print @cardHolders
    render json: @cardHolders

  end

  def recharge
    cardHolder = CardHolder.find(params[:id])
    if cardHolder.currentCharge == 8
      cardHolder.currentCharge = 0
    else
      cardHolder.currentCharge += 1
    end
    cardHolder.save
    @cardHolders = CardHolder.all
    render :index
  end

end

