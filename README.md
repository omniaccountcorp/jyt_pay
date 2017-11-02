# JytPay

金运通支付 API ruby sdk，目前提供以下接口(具体可以看 doc 中 `API` 一节)

1. 四要素认证
2. 商户余额查询
3. 代扣请求接口
4. 代付请求接口
5. 查询代扣代付订单

## 安装

Gemfile 中增加:

```ruby
gem 'jyt_pay'
```

然后执行命令:

    $ bundle

或者直接安装:

    $ gem install jyt_pay

## 快速指南

1. 初始化

```ruby
    client = JytPay::Client.new(merchant_id: merchant_id,
                                mer_viral_acct: mer_viral_acct,
                                auth_url: auth_url,
                                pay_url: pay_url,
                                draw_url: draw_url,
                                query_balance_url: query_balance_url,
                                private_key: private_key,
                                jyt_public_key: jyt_public_key)
```

2. 调用各个 api，比如查询接口：

```ruby
    client.query_balance(商户自定义唯一订单号)
```

## TODO

1. 验签
2. 替换 REXML
3. 动态加载 api
4. included 用 ActiveSupport 里的

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/jyt_pay. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Make a pull request

1. Fork it
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new Pull Request
6. Please write unit test with your code if necessary.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

