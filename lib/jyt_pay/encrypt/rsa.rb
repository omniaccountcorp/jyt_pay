# coding: utf-8

module JytPay
  module Encrypt
    module Rsa

      def self.encrypt(rsa_public_key, key_arg = Encrypt::DES_KEY)
        data = [key_arg].pack 'H*'
        kenc = rsa_public_key.public_encrypt key_arg
        kenc.unpack('H*')[0]
      end

      def self.decrypt(key_enc, rsa_private_key)
        ec = [key_enc].pack 'H*'
        rsa_private_key.private_decrypt(ec)
      end

    end
  end
end
