# coding: utf-8

# 客户端

module JytPay
  class Client

    # 代付代扣的 api
    include JytPay::Api::QuickPay
    include JytPay::Api::QuickDraw
    include JytPay::Api::QueryOrder
    # 通用 api
    include JytPay::Api::QueryBalance
    # 认证银行卡 api
    include JytPay::Api::AuthCard

    def initialize(options_arg)
      options = Utils.symbolize_keys(options_arg)

      @uris = {
        pay: URI(options[:pay_url]),
        draw: URI(options[:draw_url]),
        auth: URI(options[:auth_url]),
        query_balance: URI(options[:query_balance_url]),
      }

      @merchant_id = options[:merchant_id]
      @private_key = options[:private_key]
      @jyt_public_key = options[:jyt_public_key]

      @rsa_private_key = OpenSSL::PKey::RSA.new(@private_key)
      @rsa_jyt_public_key = OpenSSL::PKey::RSA.new(@jyt_public_key)
    end

  end
end
