import sys

def validate(line, length):
    if len(line) != length:
            raise ValueError('File has wrong format, the length must be the same as the board')
    for c in line:
        if 0 > int(c) or int(c) > 2:
            raise ValueError('File has wrong format, the board should be composed of ones and zeroes')

def translate(line, output):
    pass

def main():

    if len(sys.argv) != 2:
        raise ValueError('Please provide a text file to read from')

    input = open(sys.argv[1], "r")
    output = open(f'{sys.argv[1][:-4:]}.lp', 'w')

    lines = input.readlines()

    try: 
        length = int(lines[0])
    except Exception as e:
        raise ValueError('File has wrong format, the size of the board must only be a positive integer')

    for i in range(1, length):
        line = lines[i].rstrip()
        validate(line, length)
        translate(line, output)

if __name__ =='__main__':
    main()