# coding: utf-8
require 'jyt_pay_helper'

describe '商户余额查询' do
  it '成功（没有测试账号）'

  it '失败' do
    result = client.query_balance JytPay::Utils.gen_flow_id

    puts result

    expect(result[:result]).to eq('F')
  end
end