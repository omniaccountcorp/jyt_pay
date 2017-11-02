# coding: utf-8

module JytPay
  module Encrypt
    module Des

      ALG = 'DES-CBC'

      def self.encrypt(str, key_arg = Encrypt::DES_KEY)
        des = OpenSSL::Cipher::Cipher.new(ALG)
        des.key = key_arg
        des.iv = key_arg
        des.encrypt
        cipher = des.update(str) + des.final
        cipher.unpack('H*')[0]
      end

      def self.decrypt(xml_enc, key_str)
        xml_str = [xml_enc].pack 'H*'

        des = OpenSSL::Cipher::Cipher.new(ALG)
        des.decrypt
        des.key = key_str
        des.iv = key_str
        des.update(xml_str) + des.final
      end

    end
  end
end
