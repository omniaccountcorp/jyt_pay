# coding: utf-8
# 快捷支付相关常量

module ConstSupport
  # 商户号
  def merchant_id
    '290060100001' # 测试号
  end

  def private_key
    <<-EOF
-----BEGIN PRIVATE KEY-----
MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQC7VceBwifsxEzH
aePtki6nQR8NVEalWXCKXh0s+4vJZQeRGT0ThBbBaC5++YIXh5Qvc5Lp9zue9Vd4
bRpwo+veKgHkK16nRONl2Fu9//t3zSxLJAUcriYJ+E5MrNibB5x/cWa64Y9G/C/+
GNnQVL1cCc3k+9vxn9Q/MVxUfzlhUAsGbpo5QVdt1srUyM5jydsD5kTify+5DCgU
XhrnVykUorn+q9YZd6UZ38fnEExBlS/6SdJLpezdiWeJs3WN/jwhAB8MFi6IxqRO
D/tGMduBEMFt7bR9m9wTjWa5NRKKD2eU8o1xHg1BY5Un7PelDi5qQ9bEDdhfWWKi
5/cjtSUbAgMBAAECggEAfq5tMaQ4F3ZPbXJ//cGi5tu0wfDBrUMkRY2LMUYRq2k0
iryEftQOB1AKUTcs7/hxDv2a1bioir/iHL+6530SHbROfxuM8JQ3KkH7GCsoxETs
tQtwoYpqksdlO5iPCZdGDzCChdHOb/ROCAiKEsWbH8hJgZWHkIfCodEhXMqD5Pdv
Jz5kZq/7tlTubt+Im5bHoHZNsabrtxYXGMRJtbK7EV6rQ37ftoqFoKatVbIxRGi3
W6ay/YS8PyOrMudnG6P90Mx0yECgsK9caAbcfkNpmuBhpmki83HxKFlDpa4a4/OE
tCc5sJVDQIJBkMwb/LdyaTJgOgTiqZ2JTK9iQiTr8QKBgQD5iQ9W6SkMT4ZMbRM2
H41ZU7xEAo80KV8y3jsZqaNCRfq6D4YXAHlMpksAcg+GJczucTYj4VvK5ECBe+yV
iBN199cCdTPF8/G2ylHki4lkf87FXmc8fbmkkcvyfAottNmey+WnhasgQDONfI42
3FS1TZUzNBc+4OGV4Z227hs15wKBgQDAMDObUP5pppyHw5ne87pbRIbCr5jAKAY/
uPcIKUlJjI1g1rNmmDBzByH0i7UHFwXGv9w5TXGTV8DH4s7qcwcPAjPni8wMW9pL
J3ZjgMRmhG3ZChFZdkK/xXEF5Fyx60YR8KR5ABmWov/7LLfJVwk3TZ2XGDMn4VYV
UTwdv/mIrQKBgQC8CDOu4fM0e5hPbsHTPuNcNGThOqx+Oc6qnhsas2F6RxEvsxLv
skO1JnnN1CUuiL1rz5NkZiStNmIFMESOSQOhGSjDiV2CBNhXTQ14kkztlgFRaFmS
k4qYH+T2y9E/r89sgWiEW40fuEEglIL1hAGwvM14z//UOdDDCEe32KRYcQKBgAsS
u+Z3BDGSJ/KqknMGF/aqPBl7hJGNvM5vGcyelFpofrzVogCHRENcZdhxNDz0VqDc
7RNgIusaY0EhEErx1bZHqjXtGBSeNjWeUHPrN2Wwu6OFsPo2liH2fkyYm76kj6T4
+IEAQHktaxJNwUkYeq91CV9rRYdGtG8F/zC3nukBAoGBAK8zwbgIlB4yQS/zQ4xS
fvP7QPBMu+FAuhcIrH2DWISGadRR6vqGWKKhs7O2SJmBH/X+f/RkVNqIMjCALfXZ
uE2c7vXSz2+KfVg8YQnVZN9wsjkFkGAXd7JNSC6CA7ZhP2KU3LpBLqDg+jAaqFNI
gv+yOmeEOjobNpsBycw92Xpg
-----END PRIVATE KEY-----
    EOF
  end

  def jyt_public_key
    <<-EOF
-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAs/SFJ3wHdQdwGKiZKbxL
Hed8fpX8waAfqbNv65uCFdd2mMcpswWBawLQvOBhID8i0npWylxj4XfEcwq+pTwe
tTHjVmJ/s0P34tYasddfy9r7jyqmQzsgw6VQqrQxZNSTyF0YKYmGrvuZ+Hp6z83g
4XeVyNRwRg7CE803DNMvFWf4Nchy8Y5mFF8X9CLz0j/NkMjSBRjyaDb5PEXOz7nV
xroWYzMjYFunO2b/1a7eJWQkxV+W1YrLxNnxKjgFXr0jqjkCdC0SdlW/ek9+GtT4
29++oCz6H8gwFeE5VqjZAHwYNcnmW0fn/jWFOvFyEsy2jiov4m7D8DrkZrrNt+0N
4wIDAQAB
-----END PUBLIC KEY-----
    EOF
  end

  def auth_url
    'https://test.jytpay.com/JytAuth/tranCenter/authReq.do'
  end

  def pay_url
    'https://test.jytpay.com/JytCPService/tranCenter/encXmlReq.do'
  end

  def draw_url
    'https://test.jytpay.com/JytCPService/tranCenter/encXmlReq.do'
  end

  def query_balance_url
    'https://test.jytpay.com/JytCPService/tranCenter/cpBatchReq.do'
  end

  def client
    @client ||= JytPay::Client.new(merchant_id: merchant_id,
                                   auth_url: auth_url,
                                   pay_url: pay_url,
                                   draw_url: draw_url,
                                   query_balance_url: query_balance_url,
                                   private_key: private_key,
                                   jyt_public_key: jyt_public_key)
  end
end
