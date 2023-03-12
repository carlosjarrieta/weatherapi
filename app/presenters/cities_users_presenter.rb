class CitiesUsersPresenter < Struct.new(:scope, :cu)
  class << self
    def collection(scope, cities_users)
      cities_users.map {|cu| CitiesUsersPresenter.new(scope, cu)}
    end
  end

  def user
    cu.present? ? cu.user.name : ""
  end

  def city
    cu.present? ? cu.city.name : ""
  end

  def created_at
    cu.present? ? cu.created_at : ""
  end


  def method_missing(method, *args, &block)
    if scope.respond_to?(method)
      scope.send(method, *args, &block)
    else
      super
    end
  end
end