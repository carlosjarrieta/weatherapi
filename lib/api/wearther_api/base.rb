module Api
  module WeartherApi
    class Base
      require "uri"
      require "net/http"

      attr_accessor :url_string, :request, :https, :response, :params

      API_URL = YAML.load_file("#{Rails.root}/config/application.yml")[Rails.env]['api_url']
      API_KEY = YAML.load_file("#{Rails.root}/config/application.yml")[Rails.env]['api_key']

      def set_configuration(url)
        https = Net::HTTP.new(url.host, url.port)
        https.use_ssl = true
        request = Net::HTTP::Get.new(url)
        response = https.request(request)
        puts response.read_body
      end
    end
  end
end