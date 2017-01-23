# Ruby Bank

A simple app with online banking logic.  

Prepared individually over a course of one day as a sample tech test during Makers Academy web development course.

To play, you need to have an interactive ruby shell installed.  

#### Instructions:

(These instructions are for people with Ruby and irb installed on their machines. If you do not have Ruby installed on your machine, you need to start from installing it)  

- clone this repo  
- go to project folder  
```
cd bank
```
- open the irb in your terminal  
```
irb
```
- then:

```ruby
require "./lib/bank"
```
```ruby
bank = Bank.new({bank_statement: BankStatement.new, transaction_klass: Transaction, account: Account.new, transaction_history: TransactionHistory.new})
```
```ruby
bank.make_deposit(1000)
```
```ruby
bank.make_withdrawal(300)
```
```ruby
bank.show_bank_statement
```

- To run tests:
  - If you haven't rspec installed, you will need to do it to run tests:  
  ```
  gem install rspec
  ```
  - when rspec is safely installed at your computer, run it like so:  
  ```
  rspec
  ```

#### Specification

Guidance for the project:  

##### Requirements

* You should be able to interact with the your code via a REPL like IRB or the JavaScript console.  (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

##### Acceptance criteria

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
