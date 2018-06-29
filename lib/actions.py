#encoding:utf-8
import os
import shutil,errno
from subprocess import call
import ConfigParser
from pathlib2 import Path

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
                dir = os.path.dirname(dst)
                print 'create dir' + dir
                if not os.path.exists(dir):
                    Path(dir).mkdir(exist_ok=True)
                shutil.copy(src, dst)
            else: raise
def remove_dir(dir):
    if check_exists(dir):
        shutil.rmtree(dir)

def replace_str_infile(file_src,str_src = None,src_dst=None,str_list=None):
    if check_exists(file_src):
        with open(file_src, "r") as fin:
            with open("temp", "w") as fout:
                for line in fin:
                    if str_list is None:
                        fout.write(line.replace(str_src, src_dst))
                    else:
                        #relace all string in str_list
                        str_res = line
                        for key,value in str_list.items():
                            str_res = str_res.replace(key,value)
                        fout.write(str_res)
        os.remove(file_src)
        rename_file('temp',file_src)


def check_exists(path):
    if os.path.exists(path):
        return True
    else:
        print 'no such file or directory' + path;
        return False

def pod_install(dir):
    print 'start install CocoaPods ======================'
    call(['ls'])
    try:
        call(['pod','install','--verbose','--no-repo-update'],cwd=dir)
    except:
        print 'fatal error: pod install failed'