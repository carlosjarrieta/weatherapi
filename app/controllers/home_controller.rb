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
      save_city_search
    end

    respond_to do |format|
      format.turbo_stream do
        render layout: false
      end
    end
  end

  private
  def save_city_search
    current_user.city_users.create(city: @city)
  end
end
