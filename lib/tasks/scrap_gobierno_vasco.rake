desc "importar datos del gobierno vasco"
task :scrap_gobierno_vasco => :environment do
  require 'rubygems'
  require 'mechanize'
  require 'nokogiri'
  require 'ap'
  
  a = Mechanize.new { |agent|
    agent.user_agent_alias = 'Mac Safari'
  }


  #parse a page result
  a.get('http://www.euskadi.net/r33-2273x/es/?r01kCommonSearchQry=ty(1%237%2377)$$md(documentLanguage%23EQ%23es)$$md(prcAdvType%23EQ%232)$$md(prcStatus%23EQ%2324)$$ax()$$pr(Inter)&r01kNumResultsPerPage=10') do |page|
    #get the links to the licitaciones for the page
    page.links_with(:href => %r{/r33-2288/es/contenidos/contratacion/} ).each do |linkLicitacion|
      #get the licitacion page
      datosLicitacion={}
      a.get('http://www.euskadi.net' + linkLicitacion.href) do |licitacion|
        #parse the licitacion page
        doc = Nokogiri::HTML(licitacion.content)
        doc.xpath('//span[@class="r01LadilloServicios"]','//div[@class="r01LadilloServicios"]').each do |campos|
          campo = campos.inner_text.gsub("\r"," ").gsub("\n"," ").split(" ").join(" ")
          valor = campos.next().next().inner_text.gsub("\r"," ").gsub("\n"," ").split(" ").join(" ")
          datosLicitacion[campo]=valor
        end
        ap datosLicitacion
        #create the licitacion record starting by searching or initializing it.
        l = Licitacion.find_or_initialize_by_expediente_and_fuente_datos_id(datosLicitacion['Código del expediente'],1)
        l.descripcion=datosLicitacion['Objeto del contrato']
        l.save
      end
    end
  end
  
end