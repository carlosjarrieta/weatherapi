class CityPresenter < Struct.new(:scope, :city)
  class << self
    def collection(scope, cities)
      cities.map {|city| CityPresenter.new(scope, city)}
    end
  end

  def id
    city.id.to_s
  end

  def name
    city.name.present? ? city.name : ""
  end


  def method_missing(method, *args, &block)
    if scope.respond_to?(method)
      scope.send(method, *args, &block)
    else
      super
    end
  end
end