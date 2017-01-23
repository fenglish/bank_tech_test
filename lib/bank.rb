class Bank

  attr_reader :account

  def initialize
    @account = 0
  end

  def deposite(money)
    @account += money
  end

  def withdraw(money)
    raise "Can not withdraw the amount of money!" if @account < money
    @account -= money
  end
end
