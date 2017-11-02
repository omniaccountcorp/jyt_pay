# coding: utf-8
# 商户余额查询
module JytPay
  module Api
    module QueryBalance

      QUERY_BALANCE_TRAN_CODE = "TC2020"

      # 查询商户当前余额
      #
      # @param flow_id [ String ] 订单号
      #
      # @return [ Hash ] 结果集
      #   * :result [String] 是否成功，`F`, `S`, `P`
      #   * :msg [String] 结果说明
      #   * :balance [Float] 余额
      #
      def query_balance(flow_id)
        params = {
          mer_viral_acct: @mer_viral_acct,
        }

        xml_str = JytPay::Xml.generate(@merchant_id, QUERY_BALANCE_TRAN_CODE,
                                       params, flow_id)

        response = Http.post(@merchant_id, @uris[:query_balance],
                             QUERY_BALANCE_TRAN_CODE, xml_str,
                             @rsa_private_key, @rsa_jyt_public_key)

        res = {
          result: 'F',
          msg: response[:head][:resp_desc],
          balance: 0,
        }

        case response[:head][:resp_code]
        when 'S0000000'
          res = {
            result: 'S',
            msg: response[:head][:resp_desc],
            balance: response[:body][:balance].to_f,
          }
        end

        res
      end

    end # module QueryBalance
  end # module Api
end # module
