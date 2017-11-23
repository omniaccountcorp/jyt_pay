# coding: utf-8
require 'jyt_pay_helper'

describe '查询' do
  context '代付余额' do
    it '成功' do
      result = client.query_balance(JytPay::Utils.gen_flow_id,
                                    '00120000000010000010')

      puts result

      expect(result[:result]).to eq('S')
    end
  end

  context '代收余额' do
    it '成功' do
      result = client.query_balance(JytPay::Utils.gen_flow_id,
                                    '00120000000010000009')

      puts result

      expect(result[:result]).to eq('S')
    end
  end
end
