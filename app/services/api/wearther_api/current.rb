module Api
  module WeartherApi
    class Current < Base
      def initialize(city_name)
        @city_name = city_name
        run unless @city_name.empty?
      end

      private
      def run
        url_string = "%{api_url}/current.json?key=%{key}&q=%{city_name}&aqi=no" % {api_url: API_URL, key: API_KEY, city_name: city_name}
        url = URI(url_string)
        set_configuration(url)
        city_info
      end
    end
  end
end