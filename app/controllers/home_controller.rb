class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    session["user_id"] = current_user.id
    get_my_cities
  end

  def search
    if params[:name_city].present?
      name_search = params[:name_city].downcase
      @city = get_city_on_cache(name_search)
      if @city.nil?
        ActionCable.server.broadcast "city_channel", {
          message: I18n.t('dashboard.city_nil'),
          date: Time.now, user_id: current_user.id, city_nil: true }
      else
        CitiesUser.create(city: @city, user: current_user)
      end
    end

    respond_to do |format|
      get_my_cities
      format.turbo_stream do
        render layout: false
      end
    end
  end

  private

  def get_city_on_cache(name_search)
    #1.primero la busco en el cache de redis
    city = Rails.cache.read(name_search)
    if city.nil?
      #2. Si ya no esta disponible en redis, la busco el la DB PostgreSql
      city = City.where("name_search like ?", "%#{name_search}%").first
      #3. Si tampoco esta en PostgreSql, entonces la busco en el Api de weatherApi y la cacheo en redis por 12 horas
      if city.nil?
        city = Rails.cache.fetch(name_search, expires_in: 12.hours) do
          CityConverterHelper::Convert.new(Api::WeartherApi::Current.new(name_search), name_search).call
        end
      end
    end
    city
  end

  def get_my_cities
    @my_cities = current_user.cities.order(created_at: :desc).limit(5)
  end
end
