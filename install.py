#!/usr/bin/python
# encoding utf-8

""" Install all files which my .emacs need

This script will install all files which my .emacs file need,
.e.g cscope. The purpose of writing this script is to simply the
configure of emacs

Have fun!
"""

import getopt

class Python

class MyConfig:
    def __init__(self):
        pass

if __name__ == '__main__':
    try:
        opts, args = getopt.getopt(sys.argv[1:], "hcap", ["help", "config", "build-all", "build-path"])
    except getopt.GetoptError, err:
        print str(err)
        usage()
        sys.exit(2)

    for o, a in opts:
        if o in ("-h", "--help"):
            usage()
            sys.exit()
        elif o in ("-c", "--config"):
            p = MainWindow(os.getcwd() + '/config')
            gtk.main()
        elif o in ("-a", "--build-all"):
            pre_build()
            os.system('make')
        elif o in ("-p", "--build-path"):
            c = Rules(_vars, _vars_number, _file_header)
            c.create_rules()
        else:
            assert False, "invalid option %s" %(o)
