import sys
import random


def check_sorted(A):
    if len(A) > 1:
        for i in range(1, len(A)):
            if A[i-1] > A[i]:
                return False
    return True


def main():
    if len(sys.argv) < 2:
        print("Please provide arguments to sort.")
        sys.exit()

    A = sys.argv[1:]
    while not check_sorted(A):
        random.shuffle(A)

    print(' '.join(A))


if __name__ == '__main__':
    main()
