#encoding:utf-8
from lib.exception import  GeneratorIllegalProjectNameException
from lib import actions
import ConfigParser
import os.path
def main(template_name):
    config = ConfigParser.RawConfigParser()
    config.read('templates/'+template_name+'/config.cfg')
    template_project_name = config.get('template','name')
    template_organization = config.get('template','organization')
    template_organization_id = config.get('template','organization_id')

    project_name = raw_input("input project name:")
    if len(project_name) == 0:
        print 'project name is illegal'
        raise GeneratorIllegalProjectNameException

    organization = raw_input("input organization name(defualt is "+template_organization_id+"):")
    if len(organization) == 0:
        organization = template_organization
    organization_identify = raw_input("input organization identify (defualt is "+template_organization_id+"),your bundle id will be like(localIndetify."+project_name+"):")

    if len(organization_identify) == 0:
        organization_identify = template_organization_id

    #copy file
    actions.copy_file('templates/'+template_name+'/'+template_project_name,project_name+'/'+project_name)
    actions.copy_file('templates/'+template_name+'/'+template_project_name+'.xcodeproj/project.pbxproj',project_name+'/'+project_name+'.xcodeproj/project.pbxproj')
    actions.copy_file('templates/'+template_name+'/Podfile', project_name)
    #rename files
    actions.rename_file(project_name+'/'+template_project_name,project_name+'/'+project_name)
    #handle podfile
    actions.replace_str_infile(project_name+'/'+'Podfile',template_project_name,project_name)
    #handler projectfile
    str_list = {}
    str_list[template_project_name] = project_name
    str_list[template_organization] = organization
    str_list[template_organization_id] = organization_identify
    actions.replace_str_infile(project_name+'/'+project_name+'.xcodeproj/project.pbxproj',str_list=str_list)
    #install pod
    actions.pod_install(project_name+'/')

# actions.generate_config('templates/swift/swift.cfg')

if __name__ == "__main__":
    template_name = raw_input("input template name. eg. 'oc' 'swift': ")
    main(template_name)