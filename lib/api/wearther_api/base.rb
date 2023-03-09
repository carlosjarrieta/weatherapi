module Api
  module WeartherApi
    class Base
      attr_accessor :url_string, :request, :http, :response, :params, :rails_env

      API_URL= YAML.load_file("#{Rails.root}/config/application.yml")[Rails.env]['api_url']
      API_KEY= YAML.load_file("#{Rails.root}/config/application.yml")[Rails.env]['api_key']

      def initialize(params= nil)
        @rails_env = Rails.env
        pp @rails_env
        pp API_KEY
      end
    end
  end
end
