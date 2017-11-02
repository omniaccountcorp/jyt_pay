# coding: utf-8
require 'jyt_pay_helper'

describe JytPay do
  it '设置版本号' do
    expect(JytPay::VERSION).not_to be nil
  end
end
