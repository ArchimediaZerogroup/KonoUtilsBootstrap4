module Users
  class SearchesController < UsersController

    setup_search_controller search_class: 'Users::Search'

  end
end