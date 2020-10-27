module Spree
  module UserSessionsControllerDecorator
    def self.prepended(base)
      base.before_action :associate_user, only: :create
    end

    def current_order_params
      { currency: current_currency, token: cookies.signed[:token], store_id: current_store.id }
    end
  end
end

if defined?(::Spree::UserSessionsController)
  ::Spree::UserSessionsController.prepend(Spree::UserSessionsControllerDecorator)
end
