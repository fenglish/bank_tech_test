#Bank Tech Test

This is one of Makers Academy's tech tests on Week10. The task is to write code following the acceptance criteria below;

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012
**And** a deposit of 2000 on 13-01-2012
**And** a withdrawal of 500 on 14-01-2012
**When** she prints her bank statement
**Then** she would see

```
date       || credit || debit   || balance
14/01/2012 ||        || 500.00  || 2500.00
13/01/2012 || 2000.00||         || 3000.00
10/01/2012 || 1000.00||         || 1000.00
```

###User stories
```
As a bank customer  
so that I can keep my money at a safe place until I need it
I want to deposit my money
```
```
As a bank customer
so that I can take out my money whenever I want
I want to withdraw my money I've deposited
```
```
As a bank customer
so that I can see my money transaction ordered by date
I want to print my bank statement
```
###Technology
- Ruby
- RSpec for test

###How to use
1. Clone this repository to your local
2. Open your terminal
3. Move into the folder which you cloned
4. Run this command```bundle install```
    if you are going to run tests, you should run this command
    ```
    rspec
    ```
5. Run this command```irb``` and follow below


```sh
2.3.1 :001 > require './lib/account.rb'
 => true

2.3.1 :002 > my_account = Account.new( Transaction.new )
 => #<Account:0x007fe8be024398 @balance=0, @transaction=#<Transaction:0x007fe8be0243e8 @record={}>, @transactions=[]>

2.3.1 :003 > date1 = Date.new(2012, 1, 10)
 => #<Date: 2012-01-10 ((2455937j,0s,0n),+0s,2299161j)>

2.3.1 :004 > my_account.deposit(1000, date1)
 => [{:date=>"10/01/2012", :credit=>1000, :debit=>"", :balance=>1000}]

2.3.1 :005 > date2 = Date.new(2012, 1, 13)
 => #<Date: 2012-01-13 ((2455940j,0s,0n),+0s,2299161j)>

2.3.1 :006 > my_account.deposit(2000, date2)
 => [{:date=>"10/01/2012", :credit=>1000, :debit=>"", :balance=>1000}, {:date=>"13/01/2012", :credit=>2000, :debit=>"", :balance=>3000}]

2.3.1 :007 > date3 = Date.new(2012, 1, 14)
 => #<Date: 2012-01-14 ((2455941j,0s,0n),+0s,2299161j)>

2.3.1 :008 > my_account.withdraw(500, date3)
 => [{:date=>"10/01/2012", :credit=>1000, :debit=>"", :balance=>1000}, {:date=>"13/01/2012", :credit=>2000, :debit=>"", :balance=>3000}, {:date=>"14/01/2012", :credit=>"", :debit=>500, :balance=>2500}]

2.3.1 :009 > my_account.print_bank_statement
date        || credit      || debit       || balance
14/01/2012  ||             || 500.00      || 2500.00
13/01/2012  || 2000.00     ||             || 3000.00
10/01/2012  || 1000.00     ||             || 1000.00
 => [{:date=>"10/01/2012", :credit=>1000, :debit=>"", :balance=>1000}, {:date=>"13/01/2012", :credit=>2000, :debit=>"", :balance=>3000}, {:date=>"14/01/2012", :credit=>"", :debit=>500, :balance=>2500}]
```
