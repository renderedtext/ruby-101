#!/usr/bin/env ruby

# RSpec description
require_relative '../lib/complex.rb'

describe "RexTestComplexNumber", "creation" do
  results = { "0.0" => ["0.0", "0i"], "2.0i" => ["0", "2i"], "-17.0-4.0i" => ["-17", "-4i"] }
  results.each do |a, b|
    it "should be #{a} for #{b}" do
      expect Rex::ComplexNumber.new(b[0], b[1]).to_s == a
    end
  end
end


describe "RexTestComplexNumber", "perform basic arithmetical operations" do
  i1 = Rex::ComplexNumber.new("-17", "-4i")
  i2 = Rex::ComplexNumber.new("0", "2i")
  results = [ "-17.0-2.0i", "-17.0-6.0i", "8.0-34.0i", "-2.0+8.5i" ]

  it "#{i1} + #{i2} should be #{results[0]}" do
    expect(results[0]).to eq((i1 + i2).to_s)
  end
  it "#{i1} - #{i2} should be #{results[1]}" do
    expect(results[1]).to eq((i1 - i2).to_s)
  end
  it "#{i1} * #{i2} should be #{results[2]}" do
    expect(results[2]).to eq((i1 * i2).to_s)
  end
  it "#{i1} / #{i2} should be #{results[3]}" do
    expect(results[3]).to eq((i1 / i2).to_s)
  end
end

describe "RexTestComplexNumber", "perform advanced operations" do
  i = Rex::ComplexNumber.new("-17", "-4i")
  results = [ "0.48179310734638936-4.151159428194307i", "-17.0+4.0i", "-0.05573770491803279-0.013114754098360656i" ]

  it "Square root of #{i} should be #{results[0]}" do
    expect(results[0]).to eq(i.sqrt.to_s)
  end
  it "Conjugation of #{i} should be #{results[1]}" do
    expect(results[1]).to eq(i.conjugate.to_s)
  end
  it "Reciprocal of #{i} should be #{results[2]}" do
    expect(results[2]).to eq(i.reciprocal.to_s)
  end
end
