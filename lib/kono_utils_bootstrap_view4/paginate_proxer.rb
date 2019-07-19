module KonoUtilsBootstrapView4
  ##
  # Simple PORO to proxyng the pagination operations
  class PaginateProxer < KonoUtils::PaginateProxer

    def paginate(params = {})
      collection.page(params[:page])
    end

  end
end