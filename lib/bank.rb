class Bank

  attr_reader :account

  def initialize
    @account = 0
  end

  def deposite(money)
    @account += money
  end

  def withdraw(money)
    raise "You cannot withdraw over the amount of money you have deposited." if over_withdraw?(money)
    @account -= money
  end

  def print_bank_statement
    puts 'No transaction'
  end

  private

  def over_withdraw?(money)
    @account < money
  end
end
