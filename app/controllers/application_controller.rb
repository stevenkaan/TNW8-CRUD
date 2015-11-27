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

  def GetBreadcrumbs()
    url = request.fullpath;
    elements = url.split('/')

    if elements.index("routes")
      @city = City.find(@route.city_id);
      @country = Country.find(@city.country_id);

      html = '<div class="breadcrumbs"><ul>';
      html += '<a href="http://' + request.domain + ':3000/"><li>Landen overzicht</li></a>';
      html += '<span class="crumb-divider"> > </span>';
      html += '<a href="http://' + request.domain + ':3000/countries/' + @country.id.to_s + '"><li>' + @country.country_name + '</li></a>';
      html += '<span class="crumb-divider"> > </span>';
      html += '<a href="http://' + request.domain + ':3000/cities/' + @city.id.to_s + '"><li>' + @city.city_name + '</li></a>';
      html += '<span class="crumb-divider"> > </span>';
      html += '<a href="http://' + request.domain + ':3000/routes/' + @route.id.to_s + '"><li class="active">' + @route.name_nld + '</li></a>';
      html += '</ul></div>';
    end

    if elements.index("markers") || elements.index("marker_infos") != nil
      html = '<div class="breadcrumbs"><ul>';
      html += '<a href="http://' + request.domain + ':3000/"><li>Landen overzicht</li></a>';
      html += '<span class="crumb-divider"> > </span>';
      if elements.index("markers") != nil
        markerId = elements.index("markers") + 1;
        @marker = Marker.find(elements[markerId]);

      else
        marker_info_id = elements.index("marker_infos") + 1;
        @marker_infos = MarkerInfo.find(elements[marker_info_id]);
        @marker = Marker.find(@marker_infos.marker_id);
      end

      @city = City.find(@marker.city_id);
      @country = Country.find(@city.country_id);

      html += '<a href="http://' + request.domain + ':3000/countries/' + @country.id.to_s + '"><li>' + @country.country_name + '</li></a>';
      html += '<span class="crumb-divider"> > </span>';
      html += '<a href="http://' + request.domain + ':3000/cities/' + @city.id.to_s + '"><li>' + @city.city_name + '</li></a>';
      html += '<span class="crumb-divider"> > </span>';
      html += '<a href="http://' + request.domain + ':3000/markers/' + @marker.id.to_s + '"><li class="active">' + @marker.name + '</li></a>';

      html += '</ul></div>';
    end

    if elements.index("cities") || elements.index("city_infos") != nil
      html = '<div class="breadcrumbs"><ul>';
      html += '<a href="http://' + request.domain + ':3000/"><li>Landen overzicht</li></a>';
      html += '<span class="crumb-divider"> > </span>';
      if elements.index("cities") != nil
        cityId = elements.index("cities") + 1;
        @city = City.find(elements[cityId]);
      else
        city_info_id = elements.index("city_infos") + 1;
        @city_infos = CityInfo.find(elements[city_info_id]);
        @city = City.find(@city_infos.city_id);
      end
      @country = Country.find(@city.country_id);
      html += '<a href="http://' + request.domain + ':3000/countries/' + @country.id.to_s + '"><li>' + @country.country_name + '</li></a>';
      html += '<span class="crumb-divider"> > </span>';
      html += '<a href="http://' + request.domain + ':3000/cities/' + @city.id.to_s + '"><li class="active">' + @city.city_name + '</li></a>';
      html += '</ul></div>';
    end

    if elements.index("countries") != nil
      html = '<div class="breadcrumbs"><ul>';

      countriesId = elements.index("countries") + 1;
      if elements[countriesId] != nil
        html += '<a href="http://' + request.domain + ':3000/"><li>Landen overzicht</li></a>';
        html += '<span class="crumb-divider"> > </span>';
        @countries = Country.find(elements[countriesId]);
        html += '<a href="http://' + request.domain + ':3000/countries/' + @country.id.to_s + '"><li class="active">' + @country.country_name + '</li></a>';
      else
        html += '<a href="http://' + request.domain + ':3000/"><li class="active">Landen overzicht</li></a>';
      end
      html += '</ul></div>';
    end

    html.html_safe

  end
  helper_method :GetBreadcrumbs

end
