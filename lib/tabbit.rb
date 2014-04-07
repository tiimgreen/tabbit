require "tabbit/version"

module Tabbit
  def initialize(*headers)
    @table = ''
    header.each do |h|
      header.last == h ? @table += "  #{h}  " : @table += "  #{h}  |"
    end
    puts @table
  end
end
