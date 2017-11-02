# coding: utf-8
module JytPay
  module Sign
    module Rsa

      def self.sign(rsa_private_key, str)
        digest = OpenSSL::Digest::SHA1.new
        signature_orig = rsa_private_key.sign(digest, str)
        signature_orig.unpack('H*')[0]
      end

    end
  end
end
