module CityConverterHelper
  class Convert
    attr_reader :data, :name_search, :user_id

    def initialize(json, name_search)
      @data = json
      @name_search = name_search
      @user_id = user_id
    end

    def call
      if !data.city_info.empty? && !data.city_info['error'].present?
        city = City.new
        city.name_search = name_search
        city.name = data.city_info['location']['name']
        city.region = data.city_info['location']['region']
        city.country = data.city_info['location']['country']
        city.lat = data.city_info['location']['lat']
        city.lon = data.city_info['location']['lon']
        city.tz_id = data.city_info['location']['tz_id']
        city.temp_c = data.city_info['current']['temp_c']
        city.temp_f = data.city_info['current']['temp_f']
        city.icon = data.city_info['current']['condition']['icon']
        if city.valid?
          city.save
        end
        city
      end
    end
  end
end
