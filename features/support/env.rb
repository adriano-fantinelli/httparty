require 'rspec'
require 'httparty'
require 'pry'
require 'allure-cucumber'

AMBIENTE = ENV['AMBIENTE']

PATH_MASSA = File.dirname(__FILE__) + '/' + AMBIENTE
PATH_CONFIG = File.dirname(__FILE__) + '/config/'

URL = YAML.load_file(File.dirname(__FILE__) + '/config/url.yml')
ENDPOINT = YAML.load_file(File.dirname(__FILE__) + '/config/endpoint.yml')

Dir[File.join(File.dirname(__FILE__), 'spec_helper/*.rb')].sort.each { |file| require file }

World(Instances)
