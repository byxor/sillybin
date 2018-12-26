#!/usr/bin/python3.6


def apply_interest(money, interest):
    return money + (money * (interest/100))


def simulate(starting_money, interest, years, reinvest):

    if reinvest:
        money = 0
        money_in = 0
    else:
        money = starting_money
        money_in = starting_money

    for _ in range(years):
        if reinvest:
            money += starting_money
            money_in += starting_money
        money = apply_interest(money, interest)

    return money_in, money


####################################################

currency = "£"
starting_money = 3600
starting_age = 20
ending_age = 60
age_interval = 5
interest = 2.5


def main():
    print()
    print(f"Investing Until:     {ending_age} years old") 
    print(f"Initial Investment:  {cash(starting_money)}")
    print(f"Interest:            {interest}%")

    run_simulation(False)
    run_simulation(True)


def run_simulation(reinvest):
    print()
    print()
    if reinvest:
        print(f"If you reinvest {cash(starting_money)} each year...")
    else:
        print(f"If you put in {cash(starting_money)} once...")
        
    print(f"By age {ending_age}...")
    print()
    print(f" Starting Age | Money In     | Money Out    | Profit")
    print("----------------------------------------------------------")
    for age in range(starting_age, ending_age + age_interval, age_interval):
        years = ending_age - age
        money_in, ending_money = simulate(starting_money, interest, years, reinvest)
        profit = ending_money - money_in
        print(" {:<12} | {:<12} | {:<12} | {}".format(age, cash(money_in), cash(ending_money), cash(profit)))
    print()


def cash(amount):
    return "{}{:,}".format(currency, int(amount))


if __name__ == "__main__":
    main()
