A simple app with online banking logic.  

To play, you need to have an interactive ruby shell installed.  

###Instructions:

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
bank = Bank.new
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
