require 'rails_helper'

RSpec.describe 'KonoUtilsBootstrapView4::ConceptCacher' do
  subject { KonoUtilsBootstrapView4::ConceptCacher.new }

  it do
    is_expected.to respond_to :get
  end

  it "cache" do
    expect do |b|
      subject.get('test', &b)
    end.to yield_control.once
  end

  it "cache value" do

    expect(subject.get('test') { |cache| cache.store('test', 1) }).to be == 1
    expect(subject.get('test') { |cache| cache.store('test', 2) }).to be == 1

    expect(subject).not_to be_received_message(:store)
    expect(subject.get('test') { |cache| cache.store('test', 2) }).to be == 1

  end

  it "clear" do

    subject.store('test', 1)
    expect(subject.get('test') { |cache| cache.store('test', 2) }).to be == 1
    subject.clear
    expect(subject.get('test') { |cache| cache.store('test', 2) }).to be == 2

  end

end