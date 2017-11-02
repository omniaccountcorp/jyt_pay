# coding: utf-8
# 认证银行卡
module JytPay
  module Api
    module AuthCard

      AUTH_CARD_TRAN_CODE = "TR4003"

      # 四要素认证
      #
      # @param flow_id [ String ] 订单号
      # @param card_id [ String ] 银行卡号
      # @param true_name [ String ] 真实姓名
      # @param identity_id [ String ] 身份证
      # @param phone [ String ] 银行卡预留手机号
      #
      # @return [ Hash ] 结果集
      #   * :result [String] 是否成功，`F`, `S`
      #   * :bank_name [String] 成功后会返回该卡在 jyt 系统内的中文名
      #   * :msg [String] 结果说明
      #   * :ret_code [String] 结果 CODE
      #   * :flow_id [String] 订单号
      #   * :request_body [String] 请求报文
      #   * :response_body [String] 响应报文
      #
      def auth_card(flow_id, card_id, true_name, identity_id, phone)

        params = {
          bank_card_no: card_id,
          id_num: identity_id,
          id_name: true_name,
          terminal_type: '01',
          bank_card_type: 'D',
          phone_no: phone,
        }

        xml_str = JytPay::Xml.generate(@merchant_id, AUTH_CARD_TRAN_CODE,
                                       params, flow_id)

        response = Http.post(@merchant_id, @uris[:auth],
                             AUTH_CARD_TRAN_CODE, xml_str,
                             @rsa_private_key, @rsa_jyt_public_key)

        res = {
          result: 'S0000000' == response[:head][:resp_code] ? 'S' : 'F',
          bank_name: response[:body][:bank_name],
          msg: response[:head][:resp_desc],
          ret_code: response[:head][:resp_code],
          flow_id: flow_id,
          vendor_order_id: nil, # jyt 不会返回他们的订单号
          request_body: xml_str,
          response_body: response[:xml_str],
        }

        res
      end

    end # module QuickPay
  end # module Api
end # module
