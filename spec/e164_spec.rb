require 'e164'

describe E164 do
  describe '#lookup' do
    it 'can look up a phone number' do
      expect(E164.lookup("14037238282")).to eq(["CA", "Canada"])
    end

    it 'doesn\'t flail with a malformed phone number' do
      expect(E164.lookup("@remindhq")).to eq(nil)
    end
  end
end