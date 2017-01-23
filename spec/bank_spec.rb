require "bank"

describe Bank do

  let(:bank){ described_class.new }
  it { is_expected.to respond_to :deposite }
  it "should show 50 when passed 50 " do
    expect(bank.deposite(50)).to eq 50
  end
end
