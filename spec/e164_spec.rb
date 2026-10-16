require 'e164'

describe E164 do
  describe '#lookup' do
    it 'can look up a phone number' do
      expect(E164.lookup("14037238282")).to eq(["CA", "Canada"])
    end

    %w(357 436 457 465 471 483 621 624 686 729 738 748 837 924).each do |area_code|
      it "looks up the #{area_code} overlay as US" do
        expect(E164.lookup("1#{area_code}5550100")).to eq(["US", "United States"])
      end
    end

    it 'doesn\'t flail with a malformed phone number' do
      expect(E164.lookup("@remindhq")).to eq(nil)
    end
  end
end