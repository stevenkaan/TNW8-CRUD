class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    redirect_to '/login' unless current_user
  end

  # def get_bread_crumb(url)

  #   elements = url.split('/')
    
  #   if elements.index("markers") != nil
  #     markerId = elements.index("markers") + 1;
  #     @marker = Marker.find(elements[markerId]);
  #     @city = City.find(@marker.city_id);
  #     @country = Country.find(@city.country_id);

  #   end

  #   if elements.index("cities") != nil
  #     cityId = elements.index("cities") + 1;
  #     @city = City.find(elements[cityId]);
  #     @country = Country.find(@city.country_id);

  #   end

  #   if elements.index("countries") != nil
  #     countriesId = elements.index("countries") + 1;
  #     @countries = Country.find(elements[countriesId]);
  #   end
    

  # end
  # helper_method :get_bread_crumb

end
