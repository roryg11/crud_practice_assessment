class InstrumentsController < ApplicationController
  def index
    @instruments = Instrument.all
  end

  def new
    @instrument = Instrument.new
  end

  def create
    @instrument = Instrument.create(instrument_params)
    if @instrument.save
      redirect_to instruments_path
    else
      render :new
    end
  end

  def edit
    @instrument = Instrument.find(params[:id])
  end

  def show
    @instrument = Instrument.find(params[:id])
  end

  def destroy
    @instrument = Instrument.find(params[:id])
    @instrument.destroy
    flash[:alert] = "Instrument Deleted"
    redirect_to instruments_path
  end

  def update
    @instrument = Instrument.find(params[:id])
    @instrument.update(instrument_params)
    if @instrument.save
      redirect_to instrument_path(@instrument)
      flash[:notice] = "Instrument successfully saved"
    else
      flash[:alert] = "instrument could not be saved"
      render :edit
    end
  end

  private
  def instrument_params
    params.require(:instrument).permit(:name, :group, :price)
  end
end
