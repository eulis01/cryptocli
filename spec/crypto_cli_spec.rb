# frozen_string_literal: true

RSpec.describe Crypto do
  it 'has a version number' do
    expect(Crypto::VERSION).not_to be nil
  end

  it 'has a module Crypto' do
    expect(Crypto::Api).not_to be nil
  end
end
