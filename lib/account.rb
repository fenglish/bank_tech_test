class Account
  attr_reader :transaction

  def initialize
    @transaction = {}
  end

  def deposite(money, date)
    store_transaction(money, date)
  end

  def withdraw(money, date)
    raise "You cannot withdraw over the amount of money you have deposited." if over_withdraw?(money)
    store_transaction(-money, date)
  end

  def print_bank_statement
    total = 0
    statement = []
    if no_transaction?
      puts 'No transaction'
    else
      @transaction.each do |key,values|
        values.each do |value|
          total += value
          credit, debit = "", ""
          value > 0 ? credit = sprintf('%.2f', value).to_s : debit = sprintf('%.2f', -value).to_s
          statement.unshift("\n#{key.ljust(12," ")}|| #{credit.ljust(8," ")}|| #{debit.ljust(8," ")}|| #{sprintf('%.2f',total)}")
        end
      end
      puts header_for_statement + statement.inject(:+)
    end
  end

  def show_balance
    caluclate_balance
  end

  private

  def over_withdraw?(money)
    caluclate_balance < money || caluclate_balance.nil?
  end

  def the_date_exist?(transaction_date)
    @transaction.has_key?(transaction_date)
  end

  def caluclate_balance
    return 0 if no_transaction?
    @transaction.values.flatten.inject(:+)
  end

  def no_transaction?
    @transaction == {}
  end

  def store_transaction(money, date)
    transaction_date = date.strftime("%d/%m/%Y")
    if the_date_exist?(transaction_date)
      target = @transaction[transaction_date]
      @transaction[transaction_date] = target.push(money)
    else
      @transaction[transaction_date] = [money]
    end
  end

  def header_for_statement
    ("date").ljust(12," ") + "|| " + ("credit").ljust(8," ") + "|| " + ("debit").ljust(8," ") + "|| balance"
  end
end
