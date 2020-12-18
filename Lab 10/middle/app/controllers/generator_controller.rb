require 'net/http'
require 'uri'
require 'nokogiri'

class GeneratorController < ApplicationController
  def index; end

  def create
    number = params[:number].to_i
    is_transformed_on_server = (params[:transformer] == 'server')
    uri = URI.parse('http://localhost:4000/create.xml')
    params = { number: number }
    uri.query = URI.encode_www_form(params)
    res = Net::HTTP.get_response(uri)
    respond_to do |format|
      if is_transformed_on_server
        doc = Nokogiri::XML(res.body)
        xslt = Nokogiri::XSLT(File.read('public/transformer.xslt'))
        f = File.new('app/views/generator/create.html.erb', 'w')
        f.write(xslt.transform(doc))
        f.close
        format.html
      else
        f = File.new('app/views/generator/create.xml.erb', 'w')
        f.write(Nokogiri::XML(res.body))
        f.close
        format.xml
      end
    end
  end
end
