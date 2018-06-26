#encoding:utf-8
from lib.exception import  GeneratorIllegalProjectNameException
from lib import actions
import os.path
def main():
    project_name = raw_input("input project name:")
    if len(project_name) == 0:
        print 'project name is illegal'
        raise GeneratorIllegalProjectNameException
    actions.copy_file('templates/swift',project_name)
    actions.copy_file('templates/files/Podfile', project_name + '/files/')


if __name__ == "__main__":
    main()