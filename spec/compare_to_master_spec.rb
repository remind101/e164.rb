# frozen_string_literal: true

require 'e164'



describe 'compare to master tests' do
  before(:all) do
    @original_lookup_table = E164::LookupTable

    @codes_to_ignore = {
      '1579' => true, # was labeled wrong in orignal data set
      '1900' => true, # we somehow allowed 1900
      '1911' =>true # and worse yet, 911
    }

    # get the master version of lookuptable.rb so we can compare against it.
    system('git show master:lib/e164/lookuptable.rb > testlookup.rb')

    # here we override the E164 modules lookup table
    load('testlookup.rb')
  end

  after(:all) do
    load('lib/e164/lookuptable.rb')
  end

  describe 'do the tests' do
    it 'the two libraries should not have the same hash' do
      expect(E164::LookupTable.equal?(@original_lookup_table)).to be false
      # comment this out if you aren't adding new keys.
      expect(E164::LookupTable.length).not_to eq(@original_lookup_table.length)
    end

    it 'should not have any changes from lookuptable.rb in master' do
      E164::LookupTable.each do |area_code, country_info|
        next if @codes_to_ignore.include? area_code

        expect(@original_lookup_table[area_code]).to(
          eq(country_info),
          "expected #{area_code} to work in both data sets  #{country_info} does
            not equal #{@original_lookup_table[area_code] || 'nil'}!"
        )
      end
    end

    it 'codes should match or be nil when tryin to match new to old ' do
      @original_lookup_table.each do |area_code, country_info|
        next if @codes_to_ignore.include? area_code

        expect(E164.lookup(area_code)).to(
          eq(country_info).or(be_nil),
          "expected #{area_code} in new set #{country_info}
            to be nil or same value, got #{E164.lookup(area_code)} - #{E164.lookup(area_code).class}"
        )
      end
    end
  end
end
