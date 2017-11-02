# coding: utf-8
module JytPay
  module Http

    def self.post(merchant_id, server_uri,
                  tran_code, xml_str,
                  rsa_private_key, rsa_jyt_public_key)
      body = {
        merchant_id: merchant_id,
        xml_enc: Encrypt::Des.encrypt(xml_str),
        key_enc: Encrypt::Rsa.encrypt(rsa_jyt_public_key),
        sign: Sign::Rsa.sign(rsa_private_key, xml_str)
      }

      puts "\n[#{tran_code}][#{server_uri}] 发送原始 xml 为：\n#{xml_str}\n"

      result = {}

      begin
        response = Net::HTTP.post_form(server_uri, body)

        if response.is_a?(Net::HTTPSuccess) # 返回 200 才处理
          result = unpack_body(response.body, rsa_private_key)
        else
          # 非 200 请求
          result = Http::RetCode.general_error_response(response.code)
        end
      rescue Net::ReadTimeout # 请求超时
        result = Http::RetCode.general_error_response(0)
      end

      puts "\n[#{tran_code}][#{server_uri}] 返回结果为：\n#{result}\n\n"

      result
    end

    private

    def self.unpack_body(response_body, rsa_private_key)
      # 把返回的字符串，按键值对组成 hash
      response_result = {}
      response_body.split('&').each{ |key_value_str|
        k, v = key_value_str.split('=')
        response_result[k.to_sym] = v
      }

      # 解密
      key_str = Encrypt::Rsa.decrypt(response_result[:key_enc], rsa_private_key)
      xml_str = Encrypt::Des.decrypt(response_result[:xml_enc], key_str)

      # TODO(tony): 好像没有验签啊？
      doc = ::REXML::Document.new xml_str

      result = {
        head: {},
        body: {},
        xml_str: xml_str,
      }

      root = doc.root
      if root.elements["head"]
        root.elements["head"].elements.each { |element|
          result[:head][element.name.to_sym] = element.text
        }
      end

      if root.elements["body"]
        root.elements["body"].elements.each { |element|
          result[:body][element.name.to_sym] = element.text
        }
      end

      result
    end

  end
end
