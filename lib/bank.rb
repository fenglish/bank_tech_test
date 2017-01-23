class Bank

  attr_reader :account

  def initialize
    @account = {}
  end

  def deposite(money)
    transaction_date = Date.today.strftime("%d/%m/%Y")
    store_transaction(money)
  end

  def withdraw(money)
    raise "You cannot withdraw over the amount of money you have deposited." if over_withdraw?(money)
    store_transaction(-money)
  end

  def print_bank_statement
    puts 'No transaction'
  end

  private

  def over_withdraw?(money)
    caluclate_balance < money || caluclate_balance.nil?
  end

  def the_date_exist?(transaction_date)
    @account.has_key?(transaction_date)
  end

  def caluclate_balance
    return 0 if @account == {}
    @account.values.flatten.inject(:+)
  end

  def store_transaction(money)
    transaction_date = Date.today.strftime("%d/%m/%Y")
    if the_date_exist?(transaction_date)
      target = @account[transaction_date]
      @account[transaction_date] = target.unshift(money)
    else
      @account[transaction_date] = [money]
    end
  end
end
