bottles = 99
for i in range(100):
    if bottles > 1:
        print(bottles,' bottles of root beer on the wall, ', bottles, 'bottles of root beer.')
        bottles = bottles - 1
        print('Take one down and pass it around, ', bottles, 'bottles of root beer on the wall')
    elif bottles == 1:
        print(bottles,' bottle of root beer on the wall, ', bottles, 'bottle of root beer.')
        bottles = bottles - 1
        print('Take it down and pass it around, ', bottles, 'bottle of root beer on the wall')
    else:
        print('No more bottles of root beer on the wall, no more bottles of root beer.')
        print('Go to the store and buy some more, 99 bottles of root beer on the wall.')