# coding: utf-8
# 单笔同步代付
module JytPay
  module Api
    module QuickDraw

      QUICK_DRAW_TRAN_CODE = "TC1002"

      # 单笔同步代付
      #
      # @param flow_id [ String ] 订单号
      # @param money [ Float ] 代付金额（精确到2位）
      # @param bank_business_name [ String ] 银行卡的中文名（在银行卡认证后有返回）
      # @param card_id [ String ] 银行卡号
      # @param true_name [ String ] 真实姓名
      # @param identity_id [ String ] 身份证
      # @param phone [ String ] 银行卡预留手机号
      #
      # @return [ Hash ] 结果集
      #   * :result [String] 是否成功，`F`, `S`, `P`
      #   * :msg [String] 结果说明
      #   * :ret_code [String] 结果 CODE
      #   * :flow_id [String] 订单号
      #   * :request_body [String] 请求报文
      #   * :response_body [String] 响应报文
      #
      def quick_draw(flow_id, money,
                     bank_business_name, card_id,
                     true_name, identity_id, province, city)

        params = {
          mer_viral_acct: "",
          agrt_no: "",
          bank_name: bank_business_name,
          account_no: card_id,
          account_name: true_name,
          account_type: "00", #对私
          branch_bank_province: province,
          branch_bank_city: city,
          branch_bank_name: "",
          tran_amt: money, #两位小数
          currency: "CNY",
          bsn_code: "09400", #14900其他费用
          cert_type: "01",
          cert_no: identity_id,
          mobile: "",
          remark: "",
          reserve: "",
        }

        xml_str = JytPay::Xml.generate(@merchant_id, QUICK_DRAW_TRAN_CODE,
                                       params, flow_id)

        response = Http.post(@merchant_id, @uris[:draw],
                             QUICK_DRAW_TRAN_CODE, xml_str,
                             @rsa_private_key, @rsa_jyt_public_key)

        res = {
          result: 'P', # 默认 pending
          msg: response[:head][:resp_desc],
          ret_code: response[:head][:resp_code],
          flow_id: flow_id,
          vendor_order_id: nil, # jyt 不会返回他们的订单号
          request_body: xml_str,
          response_body: response[:xml_str],
        }

        res[:result] = Http::RetCode.draw_result(response[:head][:resp_code], response[:body][:tran_state])

        res
      end

    end # module QuickDraw
  end # module Api
end # module
