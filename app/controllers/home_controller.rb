class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    session["user_id"] = current_user.id
    get_my_cities
  end

  def search
    if params[:name_city].present?
      name_search = params[:name_city].downcase
      @city = City.where("name_search like ?", "%#{name_search}%").first
      if @city.nil?
        @city = CityConverterHelper::Convert.new(Api::WeartherApi::Current.new(name_search), name_search).call
      end
      if @city.nil?
        ActionCable.server.broadcast "city_channel", {
          message: I18n.t('dashboard.city_nil'),
          date: Time.now, user_id: current_user.id, city_nil: true }
      else
        CitiesUser.create(city: @city, user: current_user)
      end
    end

    get_my_cities
    respond_to do |format|
      format.turbo_stream do
        render layout: false
      end
    end
  end

  def get_my_cities
    @my_cities = current_user.cities.order(created_at: :desc).limit(5)
  end
end
