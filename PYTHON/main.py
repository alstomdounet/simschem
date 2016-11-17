#!/usr/bin/env python3
import logging
import mylib

def main():
    logging.basicConfig(format='%(asctime)s - %(name)s - %(levelname)s - %(message)s', filename='myapp.log', level=logging.DEBUG)
    logging.info('Started')
    mylib.do_something()
    logging.info('Finished')

if __name__ == '__main__':
    main()