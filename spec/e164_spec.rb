require 'e164'

describe E164 do
  describe '#lookup' do
    it 'can look up a phone number' do
      expect(E164.lookup('14037238282')).to eq(['CA', 'Canada'])
    end

    it 'doesn\'t flail with a malformed phone number' do
      expect(E164.lookup('@remindhq')).to eq(nil)
    end
    it 'respects 689 as valid us country code' do
      expect(E164.lookup('16891234567')).to eq(['US', 'United States'])
    end

    it 'respects 787 and 939 as Puerto Rico' do
      expect(E164.lookup('17871234567')).to eq(['PR', 'Puerto Rico'])
      expect(E164.lookup('19391234567')).to eq(['PR', 'Puerto Rico'])
    end
  end
end