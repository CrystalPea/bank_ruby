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

```
require "./lib/bank"
```
```
bank = Bank.new
```
```
bank.make_deposit(1000)
```
```
bank.make_withdrawal(300)
```
```
bank.show_bank_statement
```
