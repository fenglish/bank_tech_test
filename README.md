#Bank Tech Test

This is one of Makers Academy's tech tests on Week10. The task is to write code following the acceptance criteria below;

#### Acceptance criteria

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
so that I can see my money transaction with the date
I want to see my bank statement
```
###Technology
- Ruby
- RSpec for test
