import re
import argparse


re_input = re.compile(r'^\s*\\input\{(.*)\}\s*$')


def flatten_tex(fname, enc='utf8'):
    q = [(fname, open(fname, mode='r', encoding=enc), ), ]
    while len(q) > 0:
        fname, f = q.pop()
        line = f.readline()
        while line:
            m = re_input.match(line)
            if m:
                q.append((fname, f, ))
                fname = m.group(1)
                f = open(fname, mode='r', encoding=enc)
            else:
                print(line.rstrip())
            line = f.readline()


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--enc', type=str, default='utf8')
    parser.add_argument('fname')
    args = parser.parse_args()
    flatten_tex(args.fname, enc=args.enc)
