module Users
  class Search < KonoUtilsBootstrapView4::BaseSearch

    set_search_model User

    set_search_attributes :email
    set_search_attributes :from_date
    set_search_attributes :category_id
  end
end