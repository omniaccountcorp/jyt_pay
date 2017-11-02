# coding: utf-8
module JytPay
  module Xml

    def self.generate(merchant_id, trans_code, param_hash, flow_id)
      prefix = %q[<?xml version="1.0" encoding="UTF-8"?>]
      doc = ::REXML::Document.new "<message />"
      header = gen_header(merchant_id, trans_code, flow_id)
      body = gen_body(param_hash)
      doc.root.add(header)
      doc.root.add(body)

      r = ""
      printer = MyPrecious.new(5)
      printer.width = 1000
      printer.compact = true
      printer.write(doc, r)

      "#{prefix}\n#{r}"
    end

    private

    #fix bug in REXML::Formatters::Pretty
    class MyPrecious < REXML::Formatters::Pretty
      def write_text( node, output )
        s = node.to_s()
        s.gsub!(/\s/,' ')
        s.squeeze!(" ")

        #The Pretty formatter code mistakenly used 80 instead of the @width variable
        s = wrap(s, @width-@level)

        s = indent_text(s, @level, " ", true)
        output << (' '*@level + s)
      end
    end

    def self.gen_header(merchant_id, tran_code_arg, flow_id)
      now = Time.now
      ha = {
        version: "1.0.0",
        tran_type: "01", #自己发的永远是01
        merchant_id: merchant_id,
        tran_date: now.strftime("%Y%m%d"),
        tran_time: now.strftime("%H%M%S"),
        tran_flowid: flow_id,
        tran_code: tran_code_arg
      }

      doc = ::REXML::Document.new "<head />"
      ha.each { |key,val|
        el = ::REXML::Element.new key.to_s
        el.text = val
        doc.root.add_element el
      }

      doc
    end # def gen_header

    def self.gen_body(body_hash)
      doc = ::REXML::Document.new "<body />"

      body_hash.each { |key,val|
        el = ::REXML::Element.new key.to_s
        el.text = val
        doc.root.add_element el
      }

      doc
    end # def gen_body

  end
end
