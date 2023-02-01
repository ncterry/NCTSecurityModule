


# How to execute a non-local python script from PowerShell
# sum.py is in this directory
#$menuAddress = "C:\Program` Files\WindowsPowerShell\Modules\NCTSecurityModule\NCTFunctions"
#python "$menuAddress\sum.py" 3 4

import sys

def sum(a, b):
    print("The sum is: ", a + b)

if __name__ == "__main__":
    a = int(sys.argv[1])
    b = int(sys.argv[2])

    sum(a, b)
    