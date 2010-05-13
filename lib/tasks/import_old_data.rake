desc "import from php site"
task :import_old_data => :environment do

    require 'pg'

    DB = Sequel.connect('postgres://****:****@runnity.com/gastopublico')
    
    conn = PGconn.open(:host => 'runnity.com', :dbname => 'gastopublico', :user => 'postgres', :password => 'kjhkjh776df')
    res = conn.query('select *,x(o.the_geom) as o_lon,y(o.the_geom) as o_lat,x(l.the_geom) as l_lon,y(l.the_geom) as l_lat from licitacion as l inner join organismo as o on l.organismo_fk=o.id')
    res.each do |row|
        print row['o_lon']
    end
end