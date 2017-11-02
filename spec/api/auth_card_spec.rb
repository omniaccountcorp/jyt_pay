# coding: utf-8
require 'jyt_pay_helper'

describe '银行卡认证' do
  it '成功' do
    result = client.auth_card(JytPay::Utils.gen_flow_id,
                              '6226095723553456', '王五',
                              '421181198608283272', '15700069144')
    puts result

    expect(result[:result]).to eq('S')
  end

  it '失败' do
    result = client.auth_card(JytPay::Utils.gen_flow_id,
                              '622609572355345', '王五',
                              '421181198608283272', '15700069144')

    puts result

    expect(result[:result]).to eq('F')
  end
end
