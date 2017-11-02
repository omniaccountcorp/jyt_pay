# coding: utf-8

# 通用工具类方法

module JytPay
  module Utils

    # 把 hash 中的 key，都转化为 symbol 类型
    #
    # @param hash [Hash] 需要更改的 hash
    # @return [Hash] 更改后的 hash
    def self.symbolize_keys(hash)
      new_hash = {}
      hash.each do |key, value|
        new_hash[(key.to_sym rescue key) || key] = value
      end
      new_hash
    end

    # 通过时间，返回唯一一个24位flow id（支持分布）
    # 同一秒，同一台机器，同一个进程，最多可以产生 16777214 个不一样的订单号
    #
    # @example
    #   JytPay::Utils.gen_flow_id
    #
    # @param [ Integer ] 时间（默认是 now）
    #
    # @return [ String ] flow id
    #
    def self.gen_flow_id(time=Time.now)
      machine_id = Digest::MD5.digest(::Mac.addr).unpack("N")[0]
      process_id = Process.pid % 0xFFFF

      @counter ||= 0
      @counter += 1
      count = (@counter) % 0xFFFFFF

      return [ time.to_i, machine_id, process_id, count << 8 ].pack("N NX lXX NX").unpack("H*")[0].force_encoding('UTF-8')
    end

  end
end
