require 'rubygems'
require 'mechanize'
require 'nokogiri'

a = Mechanize.new { |agent|
  agent.user_agent_alias = 'Mac Safari'
}



a.get('http://www.euskadi.net/r33-2273x/es/?r01kCommonSearchQry=ty(1%237%2377)$$md(documentLanguage%23EQ%23es)$$md(prcAdvType%23EQ%232)$$md(prcStatus%23EQ%2324)$$ax()$$pr(Inter)&r01kNumResultsPerPage=10') do |page|
  page.links_with(:href => %r{/r33-2288/es/contenidos/contratacion/} ).each do |linkLicitacion|
    a.get('http://www.euskadi.net' + linkLicitacion.href) do |licitacion|
      doc = Nokogiri::HTML(licitacion.content)
      doc.xpath('/html/body/div[5]/div[2]/div/div/div/span[14]/p[2]').each do |linksInternos|
        puts linksInternos.text
      end
    end
  end
end