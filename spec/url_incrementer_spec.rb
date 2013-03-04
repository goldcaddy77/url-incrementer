require 'spec_helper'

describe UrlIncrementer do
  it 'should have a version number' do
    UrlIncrementer::VERSION.should_not be_nil
  end

  it 'should increment using offsets' do
    type = :offset

    # test size 50 page starting at 0
    template = "http://www.example.com/searchresults?rows=%{page_size}&start=%{offset}"
    options = { page_size: 50, offset: 0 }

    ui = UrlIncrementer::Inc.new(template, type, options)
    ui.next.should == "http://www.example.com/searchresults?rows=50&start=0"
    ui.next.should == "http://www.example.com/searchresults?rows=50&start=50"
    ui.next.should == "http://www.example.com/searchresults?rows=50&start=100"

    # test size 20 page starting at 1
    options = { page_size: 20, offset: 1 }
    ui = UrlIncrementer::Inc.new(template, type, options)
    ui.next.should == "http://www.example.com/searchresults?rows=20&start=1"
    ui.next.should == "http://www.example.com/searchresults?rows=20&start=21"
    ui.next.should == "http://www.example.com/searchresults?rows=20&start=41"
  end
end