# coding: utf-8
require 'jyt_pay_helper'

describe '单笔同步代付' do
  it '失败' do
    result = client.quick_draw(JytPay::Utils.gen_flow_id, 100,
                              '中国银行', '6226095723553456', '王五',
                              '421181198608283272', '浙江', '杭州')

    expect(result[:result]).to eq('F')
  end

  it '成功' do
    result = client.quick_draw(JytPay::Utils.gen_flow_id, 100,
                              '招商银行', '6226095723553456', '王五',
                              '421181198608283272', '浙江', '杭州')

    expect(result[:result]).to eq('S')
  end
end
