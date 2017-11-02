# coding: utf-8
require 'jyt_pay_helper'

describe '查询' do
  context '支付订单' do
    it '失败' do
      result = client.query_order(JytPay::Utils.gen_flow_id, 1, :pay)

      puts result

      expect(result[:result]).to eq('F')
    end

    it '成功' do
      result = client.quick_pay(JytPay::Utils.gen_flow_id, 100,
                                '招商银行', '6226095723553456', '王五',
                                '421181198608283272', '15700069144')

      result = client.query_order(JytPay::Utils.gen_flow_id, result[:flow_id], :pay)

      puts result

      expect(result[:result]).to eq('S')
    end
  end

  context '提现订单' do
    it '失败' do
      result = client.query_order(JytPay::Utils.gen_flow_id, 1, :draw)

      puts result

      expect(result[:result]).to eq('F')
    end

    it '成功' do
      result = client.quick_draw(JytPay::Utils.gen_flow_id, 100,
                                 '招商银行', '6226095723553456', '王五',
                                 '421181198608283272', '浙江', '杭州')

      result = client.query_order(JytPay::Utils.gen_flow_id, result[:flow_id], :draw)

      puts result

      expect(result[:result]).to eq('S')
    end
  end

end
