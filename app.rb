require 'sinatra'
require 'pp'
require 'awesome_print'

before do
  input = env['rack.input'].read
  input_short = input.gsub(/\n/, '').gsub(/\s+/, ' ')
  logger.info("Method: #{request.request_method}")
  logger.info("  Path: #{request.path_info}")
  logger.info(" Query: #{request.query_string}")
  logger.info("Params: #{ap(params)}")
  logger.info("  Body: \n#{input}")
  env['rack.input'].rewind
end

get '*' do
    'Got.'
end

post '*' do
    'Posted.'
end
