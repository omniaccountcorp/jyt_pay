module JytPay
  class Railtie < ::Rails::Railtie
    initializer "jyt_pay.logger" do
      JytPay.logger = Rails.logger
    end
  end
end
