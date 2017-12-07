require 'player'

describe Player do
  subject {described_class.new("Nedbles")}

  describe "#name" do
  	it "returns the name" do
  	  expect(subject.name).to eq "Nedbles"
  	end
  end
  describe "#health" do
  	it "returns the health" do
  	  expect(subject.health).to eq 100
  	end
  end
  describe "#hurt" do
  	it "reduces the health by a value" do
  		expect{subject.hurt(10)}.to change{subject.health}.by(-10)
  	end
  end
end