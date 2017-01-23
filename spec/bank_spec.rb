require "bank"

describe Bank do

  let(:bank){ described_class.new }

  it { is_expected.to respond_to :deposite }
  it { is_expected.to respond_to :withdraw }

  context "#deposite" do
    it "should show 50 when passed 50 " do
      expect(bank.deposite(50)).to eq 50
    end
    it "should show 30 when passed 30" do
      expect(bank.deposite(30)).to eq 30
    end
    it "should show 80 when passed 30 after passing 50" do
      bank.deposite(50)
      expect(bank.deposite(30)).to eq 80
    end
  end

  context "#withdraw" do
    it "should substract the passed number from the account" do
      bank.deposite(100)
      expect(bank.withdraw(30)).to eq 70
    end
  end

end
