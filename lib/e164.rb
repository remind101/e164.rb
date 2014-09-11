require "e164/version"
require 'e164/lookuptable'

module E164
  def self.lookup(number)
    for cut_idx in (number.length-1).downto(0)
      cut = number[0..cut_idx]
      if E164::LookupTable.include?(cut)
        return E164::LookupTable[cut]
      end
    end
    return nil
  end
end
