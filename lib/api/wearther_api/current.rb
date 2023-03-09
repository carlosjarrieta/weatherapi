module Api
  module WeartherApi
    class Current < Base
      def initialize(city_name)
        url_string = "%{api_url}/current.json?key=%{key}&q=%{city_name}&aqi=no" % {api_url: API_URL, key: API_KEY, city_name: city_name}
        byebug
        url = URI(url_string)
        set_configuration(url)
      end
    end
  end
end