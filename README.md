iOS_project_generator
------

Automatically build ios project quickly with CocoaPods and some useful extensions. (Swift/OC)

###requirement
- python2.7
- Xcode8+

Usage
------

```python
python generator.py 
#this will create the project directory in current working directory
```

then follow the comment line tool
```bash
input template name. eg. 'oc' 'swift': oc
input project name:FGTimeline
input organization name(defualt is localIdentify):
input organization identify (defualt is localIdentify),your bundle id will be like(localIndetify.FGTimeline):
```


### Add custom template
- Create project using Xcode, add code you want put into template.
- Move the directory in `templates/` and make your own `templates/{{template-name}}/config.cfg`.
- You can eidt `Podfile` template in `templates/{{template-name}}/Podfile`.

### Add catagroy
- Open `templates/{{template-name}}/{{template-project-name}}.xcodeproj`.
- Add your own extension to the `catatory` or `extension` directory.


