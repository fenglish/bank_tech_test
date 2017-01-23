class Bank

  attr_reader :account
  
  def initialize
    @account = 0
  end

  def deposite(money)
    @account += money
  end
end
