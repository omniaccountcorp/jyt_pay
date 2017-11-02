# coding: utf-8
module JytPay
  module Http

    module RetCode
      # 默认的返回值
      def self.general_error_response(http_status)
        result = {
          head: {
            resp_code: 'S0000000',
            resp_desc: "网络错误( http 状态码：#{http_status})"
          },
          body: {
            tran_state: '03',
          },
          xml_str: '',
        }
      end

      # 支付的结果
      def self.pay_result(resp_code, tran_state)
        case resp_code
        when 'S0000000'
          case tran_state
          when '01'
            return 'S'
          when '03'
            return 'F'
          else
            return 'P'
          end
        when 'E0000000' # jyt 处理中
          return 'P'
        else
          return 'F'
        end
      end # self.pay_result

      # 提现的结果(目前和支付一样逻辑，但是不知道以后会不会改)
      def self.draw_result(resp_code, tran_state)
        case resp_code
        when 'S0000000'
          case tran_state
          when '01'
            return 'S'
          when '03'
            return 'F'
          else
            return 'P'
          end
        when 'E0000000' # jyt 处理中
          return 'P'
        else
          return 'F'
        end
      end # self.pay_result

    end
  end # Http
end # JytPay
