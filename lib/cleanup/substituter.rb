#encoding: utf-8
class Substituter
  def initialize
    @chars = ActiveSupport::Multibyte.proxy_class
  end

  def substitute text
    trans = @chars.new(text).normalize :kd
    trans.gsub! 'ß', 'ss'
    trans.gsub!(/([AOUaou])\314\210/u, '\1e')
    trans.unpack('U*').select { |cp|
      cp < 0x0300 || cp > 0x035F
    }.pack 'U*'
  end
end
