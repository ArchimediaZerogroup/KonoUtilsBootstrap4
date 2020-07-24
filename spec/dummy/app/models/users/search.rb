module Users
  class Search < KonoUtils::BaseSearch

    set_search_model User

    set_search_attributes :email
  end
end