module Notificable
  extend ActiveSupport::Concern

  included do
    after_create_commit :send_notification
    def send_notification
        ActionCable.server.broadcast "city_channel",{
        message: I18n.t('dashboard.city_add', user: self.user.name, city: self.city.name),
        date: self.created_at, user_id: self.user_id}
    end
  end
end