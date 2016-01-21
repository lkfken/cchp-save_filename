require 'spec_helper'

describe Cchp::SaveFilename do
  it 'has a version number' do
    expect(Cchp::SaveFilename::VERSION).not_to be nil
  end

  before(:each) do
    @save_filename = Cchp::SaveFilename.new(:basename => 'basename', :member_id => '000123456*01')
  end
  context 'the given date is a string' do
    it '#print_date' do
      @save_filename.date = '20151212'
      expect(@save_filename.print_date).to eq(Date.parse(@save_filename.date))
    end
  end
  context 'the given date is a object which can respond to #to_str' do
    before do
      @obj = instance_double('some object', :to_str => '20151231')
    end
    it '#print_date' do
      @save_filename.date = @obj
      expect(@save_filename.print_date).to eq(Date.parse('20151231'))
    end
  end

  context 'raise an error if the string is invalid' do
    it '#print_date' do
      @save_filename.date = '12/31/2015'
      expect { @save_filename.print_date }.to raise_error(Cchp::SaveFilename::InvalidDateError)
    end
  end
  context 'the given date is a date' do
    it '#print_date' do
      @save_filename.date = Date.civil(2015, 12, 31)
      expect(@save_filename.print_date).to eq(@save_filename.date)
    end
  end
end
