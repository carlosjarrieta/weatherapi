class HomeController < ApplicationController
  def index
  end

  def search
    if params[:name_city].present?
      name_search = params[:name_city].downcase
      @city = City.where("name_search like ?", "%#{name_search}%").first
      if @city.nil?
        @city = CityConverterHelper::Convert.new(Api::WeartherApi::Current.new(name_search), name_search, current_user.id).call
      end
    end

    respond_to do |format|
      format.turbo_stream do
        render layout: false
      end
    end
  end
end
