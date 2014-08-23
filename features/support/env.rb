require 'aruba/cucumber'
require 'aruba/in_process'
require 'stalker'

Aruba::InProcess.main_class = ::Stalker::Application
Aruba.process = Aruba::InProcess