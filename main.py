import sys

def validate(line, length):
    if len(line) != length:
            raise ValueError('File has wrong format, the length must be the same as the board')
    for c in line:
        if 0 > int(c) or int(c) > 2:
            raise ValueError('File has wrong format, the board should be composed of ones and zeroes')

def translate(line,numline, output):
    pos=1    
    for c in line:
        output.write('h(cell('+str(numline)+','+str(pos)+'),')
        output.write('off).\n') if int(c) == 0 else output.write('on).\n')
        pos=pos+1

def main():

    if len(sys.argv) != 3:
        raise ValueError('Please provide a text file to read from and an output file')

    input = open(sys.argv[1], "r")
    output = open(sys.argv[2], 'w+')

    lines = input.readlines()

    try: 
        length = int(lines[0])
        output.write('#const n=8')
    except Exception as e:
        raise ValueError('File has wrong format, the size of the board must only be a positive integer')

    output.write('\n')
    for i in range(1, length+1):
        line = lines[i].rstrip()
        validate(line, length)
        translate(line,i, output)

if __name__ =='__main__':
    main()
