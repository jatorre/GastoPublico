desc "importar datos del gobierno vasco"
task :scrap_gobierno_vasco => :environment do
  require 'rubygems'
  require 'mechanize'
  require 'nokogiri'
  require 'ap'
  include Geokit::Geocoders
  
  Geokit::Geocoders::google = "ABQIAAAAtDJGVn6RztUmxjnX5hMzjRR_hUjtXduhpSosBRB5xBbP9XK5NhTWEkoRzR0oFLi0-BpfVUD2ER-vzg&hl=es"
  
  fuente_datos= 'Plataforma contratacion del Gobierno Vasco'
  fd = FuenteDatos.find_or_initialize_by_nombre(fuente_datos)
  fd.save
  a = Mechanize.new { |agent|
    agent.user_agent_alias = 'Mac Safari'
  }
datos = {}

  #parse a page result
  #a.get('http://www.euskadi.net/r33-2273x/es/?r01kCommonSearchQry=ty(1%237%2377)$$md(documentLanguage%23EQ%23es)$$md(prcAdvType%23EQ%232)$$md(prcStatus%23EQ%2324)$$ax()$$pr(Inter)&r01kNumResultsPerPage=10') do |page|
    #get the links to the licitaciones for the page
    #page.links_with(:href => %r{/r33-2288/es/contenidos/contratacion/} ).each do |linkLicitacion|
      #get the licitacion page
      datosLicitacion={}
      url_licitacion ='http://localhost/licitacion.html'
      #url_licitacion ='http://www.euskadi.net' + linkLicitacion.href
      a.get(url_licitacion) do |licitacion|
        #parse the licitacion page
        doc = Nokogiri::HTML(licitacion.content)
        root = doc.xpath('//*[@id="r01Contratacion"]')
        datos = {}
        datos['url_licitacion'] = url_licitacion
        pasaron_provisionales=false
        
        root.children.each do |element|
          ele_text = element.inner_text.gsub("\r"," ").gsub("\n"," ").split(" ").join(" ")
          if (element.next()!=nil and element.next().next()!=nil)
            two_next = element.next().next().inner_text.gsub("\r"," ").gsub("\n"," ").split(" ").join(" ")
          end
          
          if(ele_text=="Tipo de contrato")
            datos['tipo_contrato'] = two_next
          end
          
          if(ele_text=="Tipo de tramitación")
            datos['tipo_tramitacion'] = two_next
          end
          
          if(ele_text=="Objeto del contrato")
            datos['descripcion'] = two_next
            datos['titulo'] = datos['descripcion']
          end
          
          if(ele_text=="Fecha de publicación de adjudicación definitiva")
            datos['fecha_adjudicacion'] = Date.strptime(two_next, '%d/%m/%Y')
          end
          
          if(ele_text=="Fecha de publicación")
            datos['fecha_publicacion'] = Date.strptime(two_next, '%d/%m/%Y')
          end
          
          if(ele_text=="Procedimiento de tramitación")
            datos['tipo_procedimiento'] = two_next
          end 
          
          if(ele_text=="Códigos CPV")
            datos['codigo_cpv'] = two_next
          end
          
          if(ele_text=="Código del expediente")
            datos['codigo_expediente'] = two_next
          end    
          
          if(ele_text=="Valor contrato inicial (primer año)")
            datos['importe_inicial'] = two_next
          end
          
          if(ele_text=="Duración del contrato o plazo de ejecución")
            datos['duracion_contrato'] = two_next
          end

          if(ele_text=="La contratación se divide en lotes")
            if(two_next=="No")
              datos['lotes'] = false
            else
              datos['lotes'] = true
            end
          end    
          
          if(ele_text=="Obtención de información")
            datos['lugar_informacion'] = two_next
            loc=nil
            #loc = GoogleGeocoder.geocode(two_next + ',spain')
            if(loc!=nil and loc.lat!=nil)
              #l.the_geom = Point.from_x_y loc.lng,loc.lat
              datos['lat']=loc.lat
              datos['lng']=loc.lng
            else
              datos['lat']=nil
              datos['lng']=nil
            end
          end
          
          if(ele_text=="Mesa de contratación")
            datos['mesa_contratacion'] = two_next
          end          
           
          if(ele_text=="Resumen de las adjudicaciones definitivas")
            pasaron_provisionales=true
          end
          
          if(ele_text == 'Lote' and pasaron_provisionales == true)
            
          end
             
             
        end        
      end
    #end
  #end
  ap datos
end