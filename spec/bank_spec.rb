require "bank"

describe Bank do

  let(:bank){ described_class.new }
  it { is_expected.to respond_to :deposite }

  context "deposite" do
    it "should show 50 when passed 50 " do
      expect(bank.deposite(50)).to eq 50
    end
    it "should show 30 when passed 30" do
      expect(bank.deposite(30)).to eq 30
    end
  end
end
