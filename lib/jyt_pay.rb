# coding: utf-8
require "uri"
require "net/http"
require "json"
require "openssl"
require "base64"
require 'rexml/document'
require 'macaddr'
require 'logger'

require "jyt_pay/version"
require "jyt_pay/utils"
# 加密验签
require "jyt_pay/xml/xml"
require "jyt_pay/sign/rsa"
require "jyt_pay/encrypt/encrypt"
require "jyt_pay/encrypt/rsa"
require "jyt_pay/encrypt/des"
# 通信
require "jyt_pay/http/ret_code"
require "jyt_pay/http/communicate"
# 代付代扣的 api
require "jyt_pay/api/quick_pay"
require "jyt_pay/api/quick_draw"
require "jyt_pay/api/query_order"
# 通用 api
require "jyt_pay/api/query_balance"
require "jyt_pay/api/auth_card"

require "jyt_pay/client"

module LoggerExtension
  def logger
    @logger ||= default_logger
  end

  def default_logger
    _logger = Logger.new(STDOUT)
    _logger.level = Logger::INFO
    _logger
  end

  def logger=(log)
    @logger = (log ? log : Logger.new('/dev/null'))
  end
end

module JytPay
  extend LoggerExtension
end

require 'jyt_pay/railtie' if defined?(::Rails)
