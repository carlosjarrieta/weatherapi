class CityPresenter < Struct.new(:scope, :city)
  class << self
    def collection(scope, cities)
      cities.map {|city| CityPresenter.new(scope, city)}
    end
  end

  def id
    city.id
  end

  def name
    city.name.present? ? city.name : ""
  end

  def country
    city.country.present? ? city.country : ""
  end

  def temp_c
    city.temp_c.present? ? city.temp_c : ""
  end

  def temp_f
    city.temp_f.present? ? city.temp_f : ""
  end

  def lat
    city.lat.present? ? city.lat : ""
  end

  def log
    city.lon.present? ? city.lon : ""
  end


  def method_missing(method, *args, &block)
    if scope.respond_to?(method)
      scope.send(method, *args, &block)
    else
      super
    end
  end
end