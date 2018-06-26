#encoding:utf-8
import os
import shutil,errno
from subprocess import call
import ConfigParser
def rename_file(src,dst):
    if check_exists(src):
        os.rename(src,dst)

def mk_dir(dst):
    if(os.path.exists(dst)):
        print 'path exists, skip mkdir'
    else:
        os.mkdir(dst)

def copy_file(src,dst):
    if check_exists(src):
        try:
            shutil.copytree(src,dst)
        except OSError as exc:
            if exc.errno == errno.ENOTDIR:
                shutil.copy(src, dst)
            else: raise

def replace_str_infile(file_src,str_src,src_dst):
    if check_exists(file_src):
        with open(file_src, "rt") as fin:
            with open("out.txt", "wt") as fout:
                for line in fin:
                    fout.write(line.replace(str_src, src_dst))

def check_exists(path):
    if os.path.exists(path):
        return True
    else:
        print 'no such file or directory' + path;
        return False

def pod_install():
    print 'start install CocoaPods ======================'
    try:
        call(['pod','install','--verbose','--no-repo-update'])
    except:
        print 'fatal error: pod install failed'