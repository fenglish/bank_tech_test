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
so that I can keep my money at a safe place
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
2.3.1 :001 > require 'date'
 => true

2.3.1 :002 > require './lib/bank.rb'
 => true

2.3.1 :003 > my_bank = Bank.new
 => #<Bank:0x007fd9f98f0360 @transaction={}>

2.3.1 :004 > today = Date.today
 => #<Date: 2017-01-23 ((2457777j,0s,0n),+0s,2299161j)>

2.3.1 :005 > my_bank.deposite(50, today)
 => [50]

2.3.1 :006 > my_bank.withdraw(30, today)
 => [50, -30]

2.3.1 :007 > my_bank.print_bank_statement
date        || credit  || debit   || balance
23/01/2017  ||         || 30.00   || 20.00
23/01/2017  || 50.00   ||         || 50.00
 => nil
```
