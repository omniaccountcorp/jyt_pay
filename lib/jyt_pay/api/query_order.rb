# coding: utf-8
# 查询代付代收订单
module JytPay
  module Api
    module QueryOrder

      QUERY_PAY_TRAN_CODE = "TC2001"
      QUERY_DRAW_TRAN_CODE = "TC2002"

      # 查询代付代收订单
      #
      # @param flow_id [ String ] 订单号
      # @param ori_flow_id [ String ] 原业务订单号
      # @param tran_type [ String ] 原业务类型：`:pay` or `:draw`
      #
      # @return [ Hash ] 结果集
      #   * :result [String] 原业务是否成功，`F`, `S`, `P`
      #   * :msg [String] 结果说明
      #   * :ret_code [String] 结果 CODE
      #   * :flow_id [String] 订单号
      #   * :request_body [String] 请求报文
      #   * :response_body [String] 响应报文
      #
      def query_order(flow_id, ori_flow_id, tran_type)
        case tran_type.to_sym
        when :pay
          server_uri = @uris[:pay]
          tran_code = QUERY_PAY_TRAN_CODE
        when :draw
          server_uri = @uris[:draw]
          tran_code = QUERY_DRAW_TRAN_CODE
        else
          raise 'unknow query tran code'
        end

        params = {
          ori_tran_flowid: ori_flow_id
        }

        xml_str = JytPay::Xml.generate(@merchant_id, tran_code,
                                       params, flow_id)

        response = Http.post(@merchant_id, server_uri,
                             tran_code, xml_str,
                             @rsa_private_key, @rsa_jyt_public_key)

        res = {
          result: 'P', # 默认 pending
          msg: response[:body][:tran_resp_desc] || response[:head][:resp_desc],
          ret_code: response[:body][:tran_resp_code] || response[:head][:resp_code],
          flow_id: flow_id,
          vendor_order_id: nil, # jyt 不会返回他们的订单号
          request_body: xml_str,
          response_body: response[:xml_str],
        }

        return res if response[:body][:tran_resp_code].nil?

        res[:result] = case tran_type.to_sym
                       when :pay
                         Http::RetCode.pay_result(response[:body][:tran_resp_code], response[:body][:tran_state])
                       when :draw
                         Http::RetCode.draw_result(response[:body][:tran_resp_code], response[:body][:tran_state])
                       end

        res
      end

    end # module QueryOrder
  end # module Api
end # module
