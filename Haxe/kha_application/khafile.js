let project = new Project('Main');

project.addParameter('-debug');
project.addLibrary('hxcpp-debugger');

project.addDefine('HXCPP_DEBUGGER');
project.addCDefine('HXCPP_DEBUGGER');
project.addParameter('-D HXCPP_DEBUGGER');

project.addDefine('HXCPP_TELEMETRY');
project.addCDefine('HXCPP_TELEMETRY');
project.addParameter('-D HXCPP_TELEMETRY');

project.addDefine('HXCPP_STACK_TRACE');
project.addCDefine('HXCPP_STACK_TRACE');
project.addParameter('-D HXCPP_STACK_TRACE');

project.addAssets('Assets/Font/**');
project.addSources('Source');

resolve(project);