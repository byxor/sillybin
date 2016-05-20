###########################################
# spin.py                                 #
#                                         #
# Author: Brandon Ibbotson                #
# Created: 20/5/16                        #
#                                         #
# Enjoy the delights of a spinning line!  #
#                                         #
###########################################

import sys, time

def spinchars():
	yield "|"
	yield "/"
	yield "-"
	yield "\\"

def main():
	while True:
		for c in spinchars():
			sys.stdout.write("\r{}".format(c))
			time.sleep(0.1)

if __name__ == "__main__":
	main()
