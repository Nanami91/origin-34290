class NoodlesController < ApplicationController

  def index
    #@noodles = Noodle.find(params[:id])
  end

  def new
    @noodle_address = NoodleAddress.new
  end

  def create
    @noodle_address = NoodleAddress.new(noodle_params)
    if @noodle_address.valid?
      @noodle_address.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def noodle_params
    params.require(:noodle_address).permit(:image, :store_name, :description, :menu, :genre, :star_id, :prefecture_id, :price, :eat_date, :post_code, :prefecture_id, :city, :home_number, :building_name, :phone_number).merge(user_id: current_user.id)
  end
  
end
