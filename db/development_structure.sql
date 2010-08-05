--
-- PostgreSQL database dump
--

SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- Name: plpgsql; Type: PROCEDURAL LANGUAGE; Schema: -; Owner: -
--

CREATE PROCEDURAL LANGUAGE plpgsql;


SET search_path = public, pg_catalog;

--
-- Name: box2d; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE box2d;


--
-- Name: st_box2d_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box2d_in(cstring) RETURNS box2d
    AS '$libdir/postgis-1.4', 'BOX2DFLOAT4_in'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_box2d_out(box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box2d_out(box2d) RETURNS cstring
    AS '$libdir/postgis-1.4', 'BOX2DFLOAT4_out'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: box2d; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE box2d (
    INTERNALLENGTH = 16,
    INPUT = st_box2d_in,
    OUTPUT = st_box2d_out,
    ALIGNMENT = int4,
    STORAGE = plain
);


--
-- Name: box3d; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE box3d;


--
-- Name: st_box3d_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box3d_in(cstring) RETURNS box3d
    AS '$libdir/postgis-1.4', 'BOX3D_in'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_box3d_out(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box3d_out(box3d) RETURNS cstring
    AS '$libdir/postgis-1.4', 'BOX3D_out'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: box3d; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE box3d (
    INTERNALLENGTH = 48,
    INPUT = st_box3d_in,
    OUTPUT = st_box3d_out,
    ALIGNMENT = double,
    STORAGE = plain
);


--
-- Name: box3d_extent; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE box3d_extent;


--
-- Name: box3d_extent_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box3d_extent_in(cstring) RETURNS box3d_extent
    AS '$libdir/postgis-1.4', 'BOX3D_in'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: box3d_extent_out(box3d_extent); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box3d_extent_out(box3d_extent) RETURNS cstring
    AS '$libdir/postgis-1.4', 'BOX3D_extent_out'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: box3d_extent; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE box3d_extent (
    INTERNALLENGTH = 48,
    INPUT = box3d_extent_in,
    OUTPUT = box3d_extent_out,
    ALIGNMENT = double,
    STORAGE = plain
);


--
-- Name: chip; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE chip;


--
-- Name: st_chip_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_chip_in(cstring) RETURNS chip
    AS '$libdir/postgis-1.4', 'CHIP_in'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_chip_out(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_chip_out(chip) RETURNS cstring
    AS '$libdir/postgis-1.4', 'CHIP_out'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: chip; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE chip (
    INTERNALLENGTH = variable,
    INPUT = st_chip_in,
    OUTPUT = st_chip_out,
    ALIGNMENT = double,
    STORAGE = extended
);


--
-- Name: geometry; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE geometry;


--
-- Name: st_geometry_analyze(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_analyze(internal) RETURNS boolean
    AS '$libdir/postgis-1.4', 'LWGEOM_analyze'
    LANGUAGE c STRICT;


--
-- Name: st_geometry_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_in(cstring) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_in'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_geometry_out(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_out(geometry) RETURNS cstring
    AS '$libdir/postgis-1.4', 'LWGEOM_out'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_geometry_recv(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_recv(internal) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_recv'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_geometry_send(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_send(geometry) RETURNS bytea
    AS '$libdir/postgis-1.4', 'LWGEOM_send'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: geometry; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE geometry (
    INTERNALLENGTH = variable,
    INPUT = st_geometry_in,
    OUTPUT = st_geometry_out,
    RECEIVE = st_geometry_recv,
    SEND = st_geometry_send,
    ANALYZE = st_geometry_analyze,
    DELIMITER = ':',
    ALIGNMENT = int4,
    STORAGE = main
);


--
-- Name: geometry_dump; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE geometry_dump AS (
	path integer[],
	geom geometry
);


--
-- Name: histogram2d; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE histogram2d;


--
-- Name: st_histogram2d_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_histogram2d_in(cstring) RETURNS histogram2d
    AS '$libdir/liblwgeom', 'lwhistogram2d_in'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_histogram2d_out(histogram2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_histogram2d_out(histogram2d) RETURNS cstring
    AS '$libdir/liblwgeom', 'lwhistogram2d_out'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: histogram2d; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE histogram2d (
    INTERNALLENGTH = variable,
    INPUT = st_histogram2d_in,
    OUTPUT = st_histogram2d_out,
    ALIGNMENT = double,
    STORAGE = main
);


--
-- Name: pgis_abs; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE pgis_abs;


--
-- Name: pgis_abs_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pgis_abs_in(cstring) RETURNS pgis_abs
    AS '$libdir/postgis-1.4', 'pgis_abs_in'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: pgis_abs_out(pgis_abs); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pgis_abs_out(pgis_abs) RETURNS cstring
    AS '$libdir/postgis-1.4', 'pgis_abs_out'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: pgis_abs; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE pgis_abs (
    INTERNALLENGTH = 8,
    INPUT = pgis_abs_in,
    OUTPUT = pgis_abs_out,
    ALIGNMENT = double,
    STORAGE = plain
);


--
-- Name: spheroid; Type: SHELL TYPE; Schema: public; Owner: -
--

CREATE TYPE spheroid;


--
-- Name: st_spheroid_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_spheroid_in(cstring) RETURNS spheroid
    AS '$libdir/postgis-1.4', 'ellipsoid_in'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_spheroid_out(spheroid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_spheroid_out(spheroid) RETURNS cstring
    AS '$libdir/postgis-1.4', 'ellipsoid_out'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: spheroid; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE spheroid (
    INTERNALLENGTH = 65,
    INPUT = st_spheroid_in,
    OUTPUT = st_spheroid_out,
    ALIGNMENT = double,
    STORAGE = plain
);


--
-- Name: _st_asgeojson(integer, geometry, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_asgeojson(integer, geometry, integer, integer) RETURNS text
    AS '$libdir/postgis-1.4', 'LWGEOM_asGeoJson'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: _st_asgml(integer, geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_asgml(integer, geometry, integer) RETURNS text
    AS '$libdir/liblwgeom', 'LWGEOM_asGML'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: _st_asgml(integer, geometry, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_asgml(integer, geometry, integer, integer) RETURNS text
    AS '$libdir/postgis-1.4', 'LWGEOM_asGML'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: _st_askml(integer, geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_askml(integer, geometry, integer) RETURNS text
    AS '$libdir/postgis-1.4', 'LWGEOM_asKML'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: _st_contains(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_contains(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'contains'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: _st_containsproperly(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_containsproperly(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'containsproperly'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: _st_coveredby(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_coveredby(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'coveredby'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: _st_covers(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_covers(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'covers'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: _st_crosses(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_crosses(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'crosses'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: _st_dwithin(geometry, geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_dwithin(geometry, geometry, double precision) RETURNS boolean
    AS '$libdir/postgis-1.4', 'LWGEOM_dwithin'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: _st_intersects(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_intersects(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'intersects'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: _st_linecrossingdirection(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_linecrossingdirection(geometry, geometry) RETURNS integer
    AS '$libdir/postgis-1.4', 'ST_LineCrossingDirection'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: _st_overlaps(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_overlaps(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'overlaps'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: _st_touches(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_touches(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'touches'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: _st_within(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION _st_within(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'within'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: addauth(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION addauth(text) RETURNS boolean
    AS $_$ 
DECLARE
	lockid alias for $1;
	okay boolean;
	myrec record;
BEGIN
	-- check to see if table exists
	--  if not, CREATE TEMP TABLE mylock (transid xid, lockcode text)
	okay := 'f';
	FOR myrec IN SELECT * FROM pg_class WHERE relname = 'temp_lock_have_table' LOOP
		okay := 't';
	END LOOP; 
	IF (okay <> 't') THEN 
		CREATE TEMP TABLE temp_lock_have_table (transid xid, lockcode text);
			-- this will only work from pgsql7.4 up
			-- ON COMMIT DELETE ROWS;
	END IF;

	--  INSERT INTO mylock VALUES ( $1)
--	EXECUTE 'INSERT INTO temp_lock_have_table VALUES ( '||
--		quote_literal(getTransactionID()) || ',' ||
--		quote_literal(lockid) ||')';

	INSERT INTO temp_lock_have_table VALUES (getTransactionID(), lockid);

	RETURN true::boolean;
END;
$_$
    LANGUAGE plpgsql;


--
-- Name: addbbox(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION addbbox(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_addBBOX'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: addgeometrycolumn(character varying, character varying, character varying, character varying, integer, character varying, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION addgeometrycolumn(character varying, character varying, character varying, character varying, integer, character varying, integer) RETURNS text
    AS $_$
DECLARE
	catalog_name alias for $1;
	schema_name alias for $2;
	table_name alias for $3;
	column_name alias for $4;
	new_srid alias for $5;
	new_type alias for $6;
	new_dim alias for $7;
	rec RECORD;
	sr varchar;
	real_schema name;
	sql text;

BEGIN

	-- Verify geometry type
	IF ( NOT ( (new_type = 'GEOMETRY') OR
			   (new_type = 'GEOMETRYCOLLECTION') OR
			   (new_type = 'POINT') OR
			   (new_type = 'MULTIPOINT') OR
			   (new_type = 'POLYGON') OR
			   (new_type = 'MULTIPOLYGON') OR
			   (new_type = 'LINESTRING') OR
			   (new_type = 'MULTILINESTRING') OR
			   (new_type = 'GEOMETRYCOLLECTIONM') OR
			   (new_type = 'POINTM') OR
			   (new_type = 'MULTIPOINTM') OR
			   (new_type = 'POLYGONM') OR
			   (new_type = 'MULTIPOLYGONM') OR
			   (new_type = 'LINESTRINGM') OR
			   (new_type = 'MULTILINESTRINGM') OR
			   (new_type = 'CIRCULARSTRING') OR
			   (new_type = 'CIRCULARSTRINGM') OR
			   (new_type = 'COMPOUNDCURVE') OR
			   (new_type = 'COMPOUNDCURVEM') OR
			   (new_type = 'CURVEPOLYGON') OR
			   (new_type = 'CURVEPOLYGONM') OR
			   (new_type = 'MULTICURVE') OR
			   (new_type = 'MULTICURVEM') OR
			   (new_type = 'MULTISURFACE') OR
			   (new_type = 'MULTISURFACEM')) )
	THEN
		RAISE EXCEPTION 'Invalid type name - valid ones are:
	POINT, MULTIPOINT,
	LINESTRING, MULTILINESTRING,
	POLYGON, MULTIPOLYGON,
	CIRCULARSTRING, COMPOUNDCURVE, MULTICURVE,
	CURVEPOLYGON, MULTISURFACE,
	GEOMETRY, GEOMETRYCOLLECTION,
	POINTM, MULTIPOINTM,
	LINESTRINGM, MULTILINESTRINGM,
	POLYGONM, MULTIPOLYGONM,
	CIRCULARSTRINGM, COMPOUNDCURVEM, MULTICURVEM
	CURVEPOLYGONM, MULTISURFACEM,
	or GEOMETRYCOLLECTIONM';
		RETURN 'fail';
	END IF;


	-- Verify dimension
	IF ( (new_dim >4) OR (new_dim <0) ) THEN
		RAISE EXCEPTION 'invalid dimension';
		RETURN 'fail';
	END IF;

	IF ( (new_type LIKE '%M') AND (new_dim!=3) ) THEN
		RAISE EXCEPTION 'TypeM needs 3 dimensions';
		RETURN 'fail';
	END IF;


	-- Verify SRID
	IF ( new_srid != -1 ) THEN
		SELECT SRID INTO sr FROM spatial_ref_sys WHERE SRID = new_srid;
		IF NOT FOUND THEN
			RAISE EXCEPTION 'AddGeometryColumns() - invalid SRID';
			RETURN 'fail';
		END IF;
	END IF;


	-- Verify schema
	IF ( schema_name IS NOT NULL AND schema_name != '' ) THEN
		sql := 'SELECT nspname FROM pg_namespace ' ||
			'WHERE text(nspname) = ' || quote_literal(schema_name) ||
			'LIMIT 1';
		RAISE DEBUG '%', sql;
		EXECUTE sql INTO real_schema;

		IF ( real_schema IS NULL ) THEN
			RAISE EXCEPTION 'Schema % is not a valid schemaname', quote_literal(schema_name);
			RETURN 'fail';
		END IF;
	END IF;

	IF ( real_schema IS NULL ) THEN
		RAISE DEBUG 'Detecting schema';
		sql := 'SELECT n.nspname AS schemaname ' ||
			'FROM pg_catalog.pg_class c ' ||
			  'JOIN pg_catalog.pg_namespace n ON n.oid = c.relnamespace ' ||
			'WHERE c.relkind = ' || quote_literal('r') ||
			' AND n.nspname NOT IN (' || quote_literal('pg_catalog') || ', ' || quote_literal('pg_toast') || ')' ||
			' AND pg_catalog.pg_table_is_visible(c.oid)' ||
			' AND c.relname = ' || quote_literal(table_name);
		RAISE DEBUG '%', sql;
		EXECUTE sql INTO real_schema;

		IF ( real_schema IS NULL ) THEN
			RAISE EXCEPTION 'Table % does not occur in the search_path', quote_literal(table_name);
			RETURN 'fail';
		END IF;
	END IF;
	

	-- Add geometry column to table
	sql := 'ALTER TABLE ' ||
		quote_ident(real_schema) || '.' || quote_ident(table_name)
		|| ' ADD COLUMN ' || quote_ident(column_name) ||
		' geometry ';
	RAISE DEBUG '%', sql;
	EXECUTE sql;


	-- Delete stale record in geometry_columns (if any)
	sql := 'DELETE FROM geometry_columns WHERE
		f_table_catalog = ' || quote_literal('') ||
		' AND f_table_schema = ' ||
		quote_literal(real_schema) ||
		' AND f_table_name = ' || quote_literal(table_name) ||
		' AND f_geometry_column = ' || quote_literal(column_name);
	RAISE DEBUG '%', sql;
	EXECUTE sql;


	-- Add record in geometry_columns
	sql := 'INSERT INTO geometry_columns (f_table_catalog,f_table_schema,f_table_name,' ||
										  'f_geometry_column,coord_dimension,srid,type)' ||
		' VALUES (' ||
		quote_literal('') || ',' ||
		quote_literal(real_schema) || ',' ||
		quote_literal(table_name) || ',' ||
		quote_literal(column_name) || ',' ||
		new_dim::text || ',' ||
		new_srid::text || ',' ||
		quote_literal(new_type) || ')';
	RAISE DEBUG '%', sql;
	EXECUTE sql;


	-- Add table CHECKs
	sql := 'ALTER TABLE ' ||
		quote_ident(real_schema) || '.' || quote_ident(table_name)
		|| ' ADD CONSTRAINT '
		|| quote_ident('enforce_srid_' || column_name)
		|| ' CHECK (ST_SRID(' || quote_ident(column_name) ||
		') = ' || new_srid::text || ')' ;
	RAISE DEBUG '%', sql;
	EXECUTE sql;

	sql := 'ALTER TABLE ' ||
		quote_ident(real_schema) || '.' || quote_ident(table_name)
		|| ' ADD CONSTRAINT '
		|| quote_ident('enforce_dims_' || column_name)
		|| ' CHECK (ST_NDims(' || quote_ident(column_name) ||
		') = ' || new_dim::text || ')' ;
	RAISE DEBUG '%', sql;
	EXECUTE sql;

	IF ( NOT (new_type = 'GEOMETRY')) THEN
		sql := 'ALTER TABLE ' ||
			quote_ident(real_schema) || '.' || quote_ident(table_name) || ' ADD CONSTRAINT ' ||
			quote_ident('enforce_geotype_' || column_name) ||
			' CHECK (GeometryType(' ||
			quote_ident(column_name) || ')=' ||
			quote_literal(new_type) || ' OR (' ||
			quote_ident(column_name) || ') is null)';
		RAISE DEBUG '%', sql;
		EXECUTE sql;
	END IF;

	RETURN
		real_schema || '.' ||
		table_name || '.' || column_name ||
		' SRID:' || new_srid::text ||
		' TYPE:' || new_type ||
		' DIMS:' || new_dim::text || ' ';
END;
$_$
    LANGUAGE plpgsql STRICT;


--
-- Name: addgeometrycolumn(character varying, character varying, character varying, integer, character varying, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION addgeometrycolumn(character varying, character varying, character varying, integer, character varying, integer) RETURNS text
    AS $_$ 
DECLARE
	ret  text;
BEGIN
	SELECT AddGeometryColumn('',$1,$2,$3,$4,$5,$6) into ret;
	RETURN ret;
END;
$_$
    LANGUAGE plpgsql STABLE STRICT;


--
-- Name: addgeometrycolumn(character varying, character varying, integer, character varying, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION addgeometrycolumn(character varying, character varying, integer, character varying, integer) RETURNS text
    AS $_$ 
DECLARE
	ret  text;
BEGIN
	SELECT AddGeometryColumn('','',$1,$2,$3,$4,$5) into ret;
	RETURN ret;
END;
$_$
    LANGUAGE plpgsql STRICT;


--
-- Name: addpoint(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION addpoint(geometry, geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_addpoint'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: addpoint(geometry, geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION addpoint(geometry, geometry, integer) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_addpoint'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_affine'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision) RETURNS geometry
    AS $_$SELECT affine($1,  $2, $3, 0,  $4, $5, 0,  0, 0, 1,  $6, $7, 0)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: area(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION area(geometry) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_area_polygon'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: area2d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION area2d(geometry) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_area_polygon'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: asbinary(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION asbinary(geometry) RETURNS bytea
    AS '$libdir/postgis-1.4', 'LWGEOM_asBinary'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: asbinary(geometry, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION asbinary(geometry, text) RETURNS bytea
    AS '$libdir/postgis-1.4', 'LWGEOM_asBinary'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: asewkb(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION asewkb(geometry) RETURNS bytea
    AS '$libdir/postgis-1.4', 'WKBFromLWGEOM'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: asewkb(geometry, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION asewkb(geometry, text) RETURNS bytea
    AS '$libdir/postgis-1.4', 'WKBFromLWGEOM'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: asewkt(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION asewkt(geometry) RETURNS text
    AS '$libdir/postgis-1.4', 'LWGEOM_asEWKT'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: asgml(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION asgml(geometry, integer) RETURNS text
    AS $_$SELECT _ST_AsGML(2, $1, $2, 0)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: asgml(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION asgml(geometry) RETURNS text
    AS $_$SELECT _ST_AsGML(2, $1, 15, 0)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: ashexewkb(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ashexewkb(geometry) RETURNS text
    AS '$libdir/postgis-1.4', 'LWGEOM_asHEXEWKB'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: ashexewkb(geometry, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ashexewkb(geometry, text) RETURNS text
    AS '$libdir/postgis-1.4', 'LWGEOM_asHEXEWKB'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: askml(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION askml(geometry, integer) RETURNS text
    AS $_$SELECT _ST_AsKML(2, transform($1,4326), $2)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: askml(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION askml(geometry) RETURNS text
    AS $_$SELECT _ST_AsKML(2, transform($1,4326), 15)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: askml(integer, geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION askml(integer, geometry, integer) RETURNS text
    AS $_$SELECT _ST_AsKML($1, transform($2,4326), $3)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: assvg(geometry, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION assvg(geometry, integer, integer) RETURNS text
    AS '$libdir/postgis-1.4', 'assvg_geometry'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: assvg(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION assvg(geometry, integer) RETURNS text
    AS '$libdir/postgis-1.4', 'assvg_geometry'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: assvg(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION assvg(geometry) RETURNS text
    AS '$libdir/postgis-1.4', 'assvg_geometry'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: astext(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION astext(geometry) RETURNS text
    AS '$libdir/postgis-1.4', 'LWGEOM_asText'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: azimuth(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION azimuth(geometry, geometry) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_azimuth'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: bdmpolyfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION bdmpolyfromtext(text, integer) RETURNS geometry
    AS $_$ 
DECLARE
	geomtext alias for $1;
	srid alias for $2;
	mline geometry;
	geom geometry;
BEGIN
	mline := MultiLineStringFromText(geomtext, srid);

	IF mline IS NULL
	THEN
		RAISE EXCEPTION 'Input is not a MultiLinestring';
	END IF;

	geom := multi(BuildArea(mline));

	RETURN geom;
END;
$_$
    LANGUAGE plpgsql IMMUTABLE STRICT;


--
-- Name: bdpolyfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION bdpolyfromtext(text, integer) RETURNS geometry
    AS $_$ 
DECLARE
	geomtext alias for $1;
	srid alias for $2;
	mline geometry;
	geom geometry;
BEGIN
	mline := MultiLineStringFromText(geomtext, srid);

	IF mline IS NULL
	THEN
		RAISE EXCEPTION 'Input is not a MultiLinestring';
	END IF;

	geom := BuildArea(mline);

	IF GeometryType(geom) != 'POLYGON'
	THEN
		RAISE EXCEPTION 'Input returns more then a single polygon, try using BdMPolyFromText instead';
	END IF;

	RETURN geom;
END;
$_$
    LANGUAGE plpgsql IMMUTABLE STRICT;


--
-- Name: boundary(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION boundary(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'boundary'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: box(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box(geometry) RETURNS box
    AS '$libdir/postgis-1.4', 'LWGEOM_to_BOX'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: box(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box(box3d) RETURNS box
    AS '$libdir/postgis-1.4', 'BOX3D_to_BOX'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: box2d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box2d(geometry) RETURNS box2d
    AS '$libdir/postgis-1.4', 'LWGEOM_to_BOX2DFLOAT4'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: box2d(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box2d(box3d) RETURNS box2d
    AS '$libdir/postgis-1.4', 'BOX3D_to_BOX2DFLOAT4'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: box2d_contain(box2d, box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box2d_contain(box2d, box2d) RETURNS boolean
    AS '$libdir/postgis-1.4', 'BOX2D_contain'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: box2d_contained(box2d, box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box2d_contained(box2d, box2d) RETURNS boolean
    AS '$libdir/postgis-1.4', 'BOX2D_contained'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: box2d_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box2d_in(cstring) RETURNS box2d
    AS '$libdir/postgis-1.4', 'BOX2DFLOAT4_in'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: box2d_intersects(box2d, box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box2d_intersects(box2d, box2d) RETURNS boolean
    AS '$libdir/postgis-1.4', 'BOX2D_intersects'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: box2d_left(box2d, box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box2d_left(box2d, box2d) RETURNS boolean
    AS '$libdir/postgis-1.4', 'BOX2D_left'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: box2d_out(box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box2d_out(box2d) RETURNS cstring
    AS '$libdir/postgis-1.4', 'BOX2DFLOAT4_out'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: box2d_overlap(box2d, box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box2d_overlap(box2d, box2d) RETURNS boolean
    AS '$libdir/postgis-1.4', 'BOX2D_overlap'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: box2d_overleft(box2d, box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box2d_overleft(box2d, box2d) RETURNS boolean
    AS '$libdir/postgis-1.4', 'BOX2D_overleft'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: box2d_overright(box2d, box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box2d_overright(box2d, box2d) RETURNS boolean
    AS '$libdir/postgis-1.4', 'BOX2D_overright'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: box2d_right(box2d, box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box2d_right(box2d, box2d) RETURNS boolean
    AS '$libdir/postgis-1.4', 'BOX2D_right'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: box2d_same(box2d, box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box2d_same(box2d, box2d) RETURNS boolean
    AS '$libdir/postgis-1.4', 'BOX2D_same'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: box3d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box3d(geometry) RETURNS box3d
    AS '$libdir/postgis-1.4', 'LWGEOM_to_BOX3D'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: box3d(box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box3d(box2d) RETURNS box3d
    AS '$libdir/postgis-1.4', 'BOX2DFLOAT4_to_BOX3D'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: box3d_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box3d_in(cstring) RETURNS box3d
    AS '$libdir/postgis-1.4', 'BOX3D_in'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: box3d_out(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box3d_out(box3d) RETURNS cstring
    AS '$libdir/postgis-1.4', 'BOX3D_out'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: box3dtobox(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION box3dtobox(box3d) RETURNS box
    AS $_$SELECT box($1)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: buffer(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION buffer(geometry, double precision) RETURNS geometry
    AS '$libdir/postgis-1.4', 'buffer'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: buffer(geometry, double precision, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION buffer(geometry, double precision, integer) RETURNS geometry
    AS '$libdir/postgis-1.4', 'buffer'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: build_histogram2d(histogram2d, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION build_histogram2d(histogram2d, text, text) RETURNS histogram2d
    AS '$libdir/liblwgeom', 'build_lwhistogram2d'
    LANGUAGE c STABLE STRICT;


--
-- Name: build_histogram2d(histogram2d, text, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION build_histogram2d(histogram2d, text, text, text) RETURNS histogram2d
    AS $_$
BEGIN
	EXECUTE 'SET local search_path = '||$2||',public';
	RETURN public.build_histogram2d($1,$3,$4);
END
$_$
    LANGUAGE plpgsql STABLE STRICT;


--
-- Name: buildarea(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION buildarea(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_buildarea'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: bytea(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION bytea(geometry) RETURNS bytea
    AS '$libdir/postgis-1.4', 'LWGEOM_to_bytea'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: cache_bbox(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION cache_bbox() RETURNS trigger
    AS '$libdir/postgis-1.4', 'cache_bbox'
    LANGUAGE c;


--
-- Name: centroid(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION centroid(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'centroid'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: checkauth(text, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION checkauth(text, text, text) RETURNS integer
    AS $_$ 
DECLARE
	schema text;
BEGIN
	IF NOT LongTransactionsEnabled() THEN
		RAISE EXCEPTION 'Long transaction support disabled, use EnableLongTransaction() to enable.';
	END IF;

	if ( $1 != '' ) THEN
		schema = $1;
	ELSE
		SELECT current_schema() into schema;
	END IF;

	-- TODO: check for an already existing trigger ?

	EXECUTE 'CREATE TRIGGER check_auth BEFORE UPDATE OR DELETE ON ' 
		|| quote_ident(schema) || '.' || quote_ident($2)
		||' FOR EACH ROW EXECUTE PROCEDURE CheckAuthTrigger('
		|| quote_literal($3) || ')';

	RETURN 0;
END;
$_$
    LANGUAGE plpgsql;


--
-- Name: checkauth(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION checkauth(text, text) RETURNS integer
    AS $_$ SELECT CheckAuth('', $1, $2) $_$
    LANGUAGE sql;


--
-- Name: checkauthtrigger(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION checkauthtrigger() RETURNS trigger
    AS '$libdir/postgis-1.4', 'check_authorization'
    LANGUAGE c;


--
-- Name: chip_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION chip_in(cstring) RETURNS chip
    AS '$libdir/postgis-1.4', 'CHIP_in'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: chip_out(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION chip_out(chip) RETURNS cstring
    AS '$libdir/postgis-1.4', 'CHIP_out'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: collect(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION collect(geometry, geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_collect'
    LANGUAGE c IMMUTABLE;


--
-- Name: collect_garray(geometry[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION collect_garray(geometry[]) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_collect_garray'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: collector(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION collector(geometry, geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_collect'
    LANGUAGE c IMMUTABLE;


--
-- Name: combine_bbox(box2d, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION combine_bbox(box2d, geometry) RETURNS box2d
    AS '$libdir/postgis-1.4', 'BOX2DFLOAT4_combine'
    LANGUAGE c IMMUTABLE;


--
-- Name: combine_bbox(box3d, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION combine_bbox(box3d, geometry) RETURNS box3d
    AS '$libdir/postgis-1.4', 'BOX3D_combine'
    LANGUAGE c IMMUTABLE;


--
-- Name: combine_bbox(box3d_extent, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION combine_bbox(box3d_extent, geometry) RETURNS box3d_extent
    AS '$libdir/postgis-1.4', 'BOX3D_combine'
    LANGUAGE c IMMUTABLE;


--
-- Name: compression(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION compression(chip) RETURNS integer
    AS '$libdir/postgis-1.4', 'CHIP_getCompression'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: contains(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION contains(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'contains'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: convexhull(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION convexhull(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'convexhull'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: create_histogram2d(box2d, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION create_histogram2d(box2d, integer) RETURNS histogram2d
    AS '$libdir/liblwgeom', 'create_lwhistogram2d'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: crosses(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION crosses(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'crosses'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: datatype(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION datatype(chip) RETURNS integer
    AS '$libdir/postgis-1.4', 'CHIP_getDatatype'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: difference(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION difference(geometry, geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'difference'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: dimension(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dimension(geometry) RETURNS integer
    AS '$libdir/postgis-1.4', 'LWGEOM_dimension'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: disablelongtransactions(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION disablelongtransactions() RETURNS text
    AS $$ 
DECLARE
	rec RECORD;

BEGIN

	--
	-- Drop all triggers applied by CheckAuth()
	--
	FOR rec IN
		SELECT c.relname, t.tgname, t.tgargs FROM pg_trigger t, pg_class c, pg_proc p
		WHERE p.proname = 'checkauthtrigger' and t.tgfoid = p.oid and t.tgrelid = c.oid
	LOOP
		EXECUTE 'DROP TRIGGER ' || quote_ident(rec.tgname) ||
			' ON ' || quote_ident(rec.relname);
	END LOOP;

	--
	-- Drop the authorization_table table
	--
	FOR rec IN SELECT * FROM pg_class WHERE relname = 'authorization_table' LOOP
		DROP TABLE authorization_table;
	END LOOP;

	--
	-- Drop the authorized_tables view
	--
	FOR rec IN SELECT * FROM pg_class WHERE relname = 'authorized_tables' LOOP
		DROP VIEW authorized_tables;
	END LOOP;

	RETURN 'Long transactions support disabled';
END;
$$
    LANGUAGE plpgsql;


--
-- Name: disjoint(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION disjoint(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'disjoint'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: distance(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION distance(geometry, geometry) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_mindistance2d'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: distance_sphere(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION distance_sphere(geometry, geometry) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_distance_sphere'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: distance_spheroid(geometry, geometry, spheroid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION distance_spheroid(geometry, geometry, spheroid) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_distance_ellipsoid_point'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: dropbbox(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dropbbox(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_dropBBOX'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: dropgeometrycolumn(character varying, character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dropgeometrycolumn(character varying, character varying, character varying, character varying) RETURNS text
    AS $_$
DECLARE
	catalog_name alias for $1; 
	schema_name alias for $2;
	table_name alias for $3;
	column_name alias for $4;
	myrec RECORD;
	okay boolean;
	real_schema name;

BEGIN


	-- Find, check or fix schema_name
	IF ( schema_name != '' ) THEN
		okay = 'f';

		FOR myrec IN SELECT nspname FROM pg_namespace WHERE text(nspname) = schema_name LOOP
			okay := 't';
		END LOOP;

		IF ( okay <> 't' ) THEN
			RAISE NOTICE 'Invalid schema name - using current_schema()';
			SELECT current_schema() into real_schema;
		ELSE
			real_schema = schema_name;
		END IF;
	ELSE
		SELECT current_schema() into real_schema;
	END IF;

 	-- Find out if the column is in the geometry_columns table
	okay = 'f';
	FOR myrec IN SELECT * from geometry_columns where f_table_schema = text(real_schema) and f_table_name = table_name and f_geometry_column = column_name LOOP
		okay := 't';
	END LOOP; 
	IF (okay <> 't') THEN 
		RAISE EXCEPTION 'column not found in geometry_columns table';
		RETURN 'f';
	END IF;

	-- Remove ref from geometry_columns table
	EXECUTE 'delete from geometry_columns where f_table_schema = ' ||
		quote_literal(real_schema) || ' and f_table_name = ' ||
		quote_literal(table_name)  || ' and f_geometry_column = ' ||
		quote_literal(column_name);
	
	-- Remove table column
	EXECUTE 'ALTER TABLE ' || quote_ident(real_schema) || '.' ||
		quote_ident(table_name) || ' DROP COLUMN ' ||
		quote_ident(column_name);

	RETURN real_schema || '.' || table_name || '.' || column_name ||' effectively removed.';
	
END;
$_$
    LANGUAGE plpgsql STRICT;


--
-- Name: dropgeometrycolumn(character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dropgeometrycolumn(character varying, character varying, character varying) RETURNS text
    AS $_$
DECLARE
	ret text;
BEGIN
	SELECT DropGeometryColumn('',$1,$2,$3) into ret;
	RETURN ret;
END;
$_$
    LANGUAGE plpgsql STRICT;


--
-- Name: dropgeometrycolumn(character varying, character varying); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dropgeometrycolumn(character varying, character varying) RETURNS text
    AS $_$
DECLARE
	ret text;
BEGIN
	SELECT DropGeometryColumn('','',$1,$2) into ret;
	RETURN ret;
END;
$_$
    LANGUAGE plpgsql STRICT;


--
-- Name: dropgeometrytable(character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dropgeometrytable(character varying, character varying, character varying) RETURNS text
    AS $_$
DECLARE
	catalog_name alias for $1; 
	schema_name alias for $2;
	table_name alias for $3;
	real_schema name;

BEGIN

	IF ( schema_name = '' ) THEN
		SELECT current_schema() into real_schema;
	ELSE
		real_schema = schema_name;
	END IF;

	-- Remove refs from geometry_columns table
	EXECUTE 'DELETE FROM geometry_columns WHERE ' ||
		'f_table_schema = ' || quote_literal(real_schema) ||
		' AND ' ||
		' f_table_name = ' || quote_literal(table_name);
	
	-- Remove table 
	EXECUTE 'DROP TABLE '
		|| quote_ident(real_schema) || '.' ||
		quote_ident(table_name);

	RETURN
		real_schema || '.' ||
		table_name ||' dropped.';
	
END;
$_$
    LANGUAGE plpgsql STRICT;


--
-- Name: dropgeometrytable(character varying, character varying); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dropgeometrytable(character varying, character varying) RETURNS text
    AS $_$ SELECT DropGeometryTable('',$1,$2) $_$
    LANGUAGE sql STRICT;


--
-- Name: dropgeometrytable(character varying); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dropgeometrytable(character varying) RETURNS text
    AS $_$ SELECT DropGeometryTable('','',$1) $_$
    LANGUAGE sql STRICT;


--
-- Name: dump(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dump(geometry) RETURNS SETOF geometry_dump
    AS '$libdir/liblwgeom', 'LWGEOM_dump'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: dumprings(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION dumprings(geometry) RETURNS SETOF geometry_dump
    AS '$libdir/postgis-1.4', 'LWGEOM_dump_rings'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: enablelongtransactions(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION enablelongtransactions() RETURNS text
    AS $$ 
DECLARE
	"query" text;
	exists bool;
	rec RECORD;

BEGIN

	exists = 'f';
	FOR rec IN SELECT * FROM pg_class WHERE relname = 'authorization_table'
	LOOP
		exists = 't';
	END LOOP;

	IF NOT exists
	THEN
		"query" = 'CREATE TABLE authorization_table (
			toid oid, -- table oid
			rid text, -- row id
			expires timestamp,
			authid text
		)';
		EXECUTE "query";
	END IF;

	exists = 'f';
	FOR rec IN SELECT * FROM pg_class WHERE relname = 'authorized_tables'
	LOOP
		exists = 't';
	END LOOP;

	IF NOT exists THEN
		"query" = 'CREATE VIEW authorized_tables AS ' ||
			'SELECT ' ||
			'n.nspname as schema, ' ||
			'c.relname as table, trim(' ||
			quote_literal(chr(92) || '000') ||
			' from t.tgargs) as id_column ' ||
			'FROM pg_trigger t, pg_class c, pg_proc p ' ||
			', pg_namespace n ' ||
			'WHERE p.proname = ' || quote_literal('checkauthtrigger') ||
			' AND c.relnamespace = n.oid' ||
			' AND t.tgfoid = p.oid and t.tgrelid = c.oid';
		EXECUTE "query";
	END IF;

	RETURN 'Long transactions support enabled';
END;
$$
    LANGUAGE plpgsql;


--
-- Name: endpoint(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION endpoint(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_endpoint_linestring'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: envelope(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION envelope(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_envelope'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: equals(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION equals(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'geomequals'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: estimate_histogram2d(histogram2d, box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION estimate_histogram2d(histogram2d, box2d) RETURNS double precision
    AS '$libdir/liblwgeom', 'estimate_lwhistogram2d'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: estimated_extent(text, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION estimated_extent(text, text, text) RETURNS box2d
    AS '$libdir/postgis-1.4', 'LWGEOM_estimated_extent'
    LANGUAGE c IMMUTABLE STRICT SECURITY DEFINER;


--
-- Name: estimated_extent(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION estimated_extent(text, text) RETURNS box2d
    AS '$libdir/postgis-1.4', 'LWGEOM_estimated_extent'
    LANGUAGE c IMMUTABLE STRICT SECURITY DEFINER;


--
-- Name: expand(box3d, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION expand(box3d, double precision) RETURNS box3d
    AS '$libdir/postgis-1.4', 'BOX3D_expand'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: expand(box2d, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION expand(box2d, double precision) RETURNS box2d
    AS '$libdir/postgis-1.4', 'BOX2DFLOAT4_expand'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: expand(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION expand(geometry, double precision) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_expand'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: explode_histogram2d(histogram2d, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION explode_histogram2d(histogram2d, text) RETURNS histogram2d
    AS '$libdir/liblwgeom', 'explode_lwhistogram2d'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: exteriorring(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION exteriorring(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_exteriorring_polygon'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: factor(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION factor(chip) RETURNS real
    AS '$libdir/postgis-1.4', 'CHIP_getFactor'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: find_extent(text, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION find_extent(text, text, text) RETURNS box2d
    AS $_$
DECLARE
	schemaname alias for $1;
	tablename alias for $2;
	columnname alias for $3;
	myrec RECORD;

BEGIN
	FOR myrec IN EXECUTE 'SELECT extent("' || columnname || '") FROM "' || schemaname || '"."' || tablename || '"' LOOP
		return myrec.extent;
	END LOOP; 
END;
$_$
    LANGUAGE plpgsql IMMUTABLE STRICT;


--
-- Name: find_extent(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION find_extent(text, text) RETURNS box2d
    AS $_$
DECLARE
	tablename alias for $1;
	columnname alias for $2;
	myrec RECORD;

BEGIN
	FOR myrec IN EXECUTE 'SELECT extent("' || columnname || '") FROM "' || tablename || '"' LOOP
		return myrec.extent;
	END LOOP; 
END;
$_$
    LANGUAGE plpgsql IMMUTABLE STRICT;


--
-- Name: find_srid(character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION find_srid(character varying, character varying, character varying) RETURNS integer
    AS $_$
DECLARE
	schem text;
	tabl text;
	sr int4;
BEGIN
	IF $1 IS NULL THEN
	  RAISE EXCEPTION 'find_srid() - schema is NULL!';
	END IF;
	IF $2 IS NULL THEN
	  RAISE EXCEPTION 'find_srid() - table name is NULL!';
	END IF;
	IF $3 IS NULL THEN
	  RAISE EXCEPTION 'find_srid() - column name is NULL!';
	END IF;
	schem = $1;
	tabl = $2;
-- if the table contains a . and the schema is empty
-- split the table into a schema and a table
-- otherwise drop through to default behavior
	IF ( schem = '' and tabl LIKE '%.%' ) THEN
	 schem = substr(tabl,1,strpos(tabl,'.')-1);
	 tabl = substr(tabl,length(schem)+2);
	ELSE
	 schem = schem || '%';
	END IF;

	select SRID into sr from geometry_columns where f_table_schema like schem and f_table_name = tabl and f_geometry_column = $3;
	IF NOT FOUND THEN
	   RAISE EXCEPTION 'find_srid() - couldnt find the corresponding SRID - is the geometry registered in the GEOMETRY_COLUMNS table?  Is there an uppercase/lowercase missmatch?';
	END IF;
	return sr;
END;
$_$
    LANGUAGE plpgsql IMMUTABLE STRICT;


--
-- Name: fix_geometry_columns(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION fix_geometry_columns() RETURNS text
    AS $$
DECLARE
	mislinked record;
	result text;
	linked integer;
	deleted integer;
	foundschema integer;
BEGIN

	-- Since 7.3 schema support has been added.
	-- Previous postgis versions used to put the database name in
	-- the schema column. This needs to be fixed, so we try to 
	-- set the correct schema for each geometry_colums record
	-- looking at table, column, type and srid.
	UPDATE geometry_columns SET f_table_schema = n.nspname
		FROM pg_namespace n, pg_class c, pg_attribute a,
			pg_constraint sridcheck, pg_constraint typecheck
	        WHERE ( f_table_schema is NULL
		OR f_table_schema = ''
	        OR f_table_schema NOT IN (
	                SELECT nspname::varchar
	                FROM pg_namespace nn, pg_class cc, pg_attribute aa
	                WHERE cc.relnamespace = nn.oid
	                AND cc.relname = f_table_name::name
	                AND aa.attrelid = cc.oid
	                AND aa.attname = f_geometry_column::name))
	        AND f_table_name::name = c.relname
	        AND c.oid = a.attrelid
	        AND c.relnamespace = n.oid
	        AND f_geometry_column::name = a.attname

	        AND sridcheck.conrelid = c.oid
		AND sridcheck.consrc LIKE '(srid(% = %)'
	        AND sridcheck.consrc ~ textcat(' = ', srid::text)

	        AND typecheck.conrelid = c.oid
		AND typecheck.consrc LIKE
		'((geometrytype(%) = ''%''::text) OR (% IS NULL))'
	        AND typecheck.consrc ~ textcat(' = ''', type::text)

	        AND NOT EXISTS (
	                SELECT oid FROM geometry_columns gc
	                WHERE c.relname::varchar = gc.f_table_name
	                AND n.nspname::varchar = gc.f_table_schema
	                AND a.attname::varchar = gc.f_geometry_column
	        );

	GET DIAGNOSTICS foundschema = ROW_COUNT;

	-- no linkage to system table needed
	return 'fixed:'||foundschema::text;

END;
$$
    LANGUAGE plpgsql;


--
-- Name: force_2d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION force_2d(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_force_2d'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: force_3d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION force_3d(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_force_3dz'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: force_3dm(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION force_3dm(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_force_3dm'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: force_3dz(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION force_3dz(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_force_3dz'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: force_4d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION force_4d(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_force_4d'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: force_collection(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION force_collection(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_force_collection'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: forcerhr(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION forcerhr(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_forceRHR_poly'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: geom_accum(geometry[], geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geom_accum(geometry[], geometry) RETURNS geometry[]
    AS '$libdir/postgis-1.4', 'LWGEOM_accum'
    LANGUAGE c IMMUTABLE;


--
-- Name: geomcollfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geomcollfromtext(text, integer) RETURNS geometry
    AS $_$
	SELECT CASE
	WHEN geometrytype(GeomFromText($1, $2)) = 'GEOMETRYCOLLECTION'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: geomcollfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geomcollfromtext(text) RETURNS geometry
    AS $_$
	SELECT CASE
	WHEN geometrytype(GeomFromText($1)) = 'GEOMETRYCOLLECTION'
	THEN GeomFromText($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: geomcollfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geomcollfromwkb(bytea, integer) RETURNS geometry
    AS $_$
	SELECT CASE
	WHEN geometrytype(GeomFromWKB($1, $2)) = 'GEOMETRYCOLLECTION'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: geomcollfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geomcollfromwkb(bytea) RETURNS geometry
    AS $_$
	SELECT CASE
	WHEN geometrytype(GeomFromWKB($1)) = 'GEOMETRYCOLLECTION'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: geometry(box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry(box2d) RETURNS geometry
    AS '$libdir/postgis-1.4', 'BOX2DFLOAT4_to_LWGEOM'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: geometry(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry(box3d) RETURNS geometry
    AS '$libdir/postgis-1.4', 'BOX3D_to_LWGEOM'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: geometry(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry(text) RETURNS geometry
    AS '$libdir/postgis-1.4', 'parse_WKT_lwgeom'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: geometry(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry(chip) RETURNS geometry
    AS '$libdir/postgis-1.4', 'CHIP_to_LWGEOM'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: geometry(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry(bytea) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_from_bytea'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: geometry_above(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_above(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'LWGEOM_above'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: geometry_analyze(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_analyze(internal) RETURNS boolean
    AS '$libdir/postgis-1.4', 'LWGEOM_analyze'
    LANGUAGE c STRICT;


--
-- Name: geometry_below(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_below(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'LWGEOM_below'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: geometry_cmp(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_cmp(geometry, geometry) RETURNS integer
    AS '$libdir/postgis-1.4', 'lwgeom_cmp'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: geometry_contain(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_contain(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'LWGEOM_contain'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: geometry_contained(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_contained(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'LWGEOM_contained'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: geometry_eq(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_eq(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'lwgeom_eq'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: geometry_ge(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_ge(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'lwgeom_ge'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: geometry_gt(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_gt(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'lwgeom_gt'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: geometry_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_in(cstring) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_in'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: geometry_le(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_le(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'lwgeom_le'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: geometry_left(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_left(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'LWGEOM_left'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: geometry_lt(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_lt(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'lwgeom_lt'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: geometry_out(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_out(geometry) RETURNS cstring
    AS '$libdir/postgis-1.4', 'LWGEOM_out'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: geometry_overabove(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_overabove(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'LWGEOM_overabove'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: geometry_overbelow(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_overbelow(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'LWGEOM_overbelow'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: geometry_overlap(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_overlap(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'LWGEOM_overlap'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: geometry_overleft(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_overleft(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'LWGEOM_overleft'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: geometry_overright(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_overright(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'LWGEOM_overright'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: geometry_recv(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_recv(internal) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_recv'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: geometry_right(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_right(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'LWGEOM_right'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: geometry_same(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_same(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'LWGEOM_same'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: geometry_send(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometry_send(geometry) RETURNS bytea
    AS '$libdir/postgis-1.4', 'LWGEOM_send'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: geometryfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometryfromtext(text) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_from_text'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: geometryfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometryfromtext(text, integer) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_from_text'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: geometryn(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometryn(geometry, integer) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_geometryn_collection'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: geometrytype(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geometrytype(geometry) RETURNS text
    AS '$libdir/postgis-1.4', 'LWGEOM_getTYPE'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: geomfromewkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geomfromewkb(bytea) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOMFromWKB'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: geomfromewkt(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geomfromewkt(text) RETURNS geometry
    AS '$libdir/postgis-1.4', 'parse_WKT_lwgeom'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: geomfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geomfromtext(text) RETURNS geometry
    AS $_$SELECT geometryfromtext($1)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: geomfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geomfromtext(text, integer) RETURNS geometry
    AS $_$SELECT geometryfromtext($1, $2)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: geomfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geomfromwkb(bytea) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_from_WKB'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: geomfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geomfromwkb(bytea, integer) RETURNS geometry
    AS $_$SELECT setSRID(GeomFromWKB($1), $2)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: geomunion(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geomunion(geometry, geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'geomunion'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: geosnoop(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION geosnoop(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'GEOSnoop'
    LANGUAGE c STRICT;


--
-- Name: get_proj4_from_srid(integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION get_proj4_from_srid(integer) RETURNS text
    AS $_$
BEGIN
	RETURN proj4text::text FROM spatial_ref_sys WHERE srid= $1;
END;
$_$
    LANGUAGE plpgsql IMMUTABLE STRICT;


--
-- Name: getbbox(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION getbbox(geometry) RETURNS box2d
    AS '$libdir/postgis-1.4', 'LWGEOM_to_BOX2DFLOAT4'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: getsrid(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION getsrid(geometry) RETURNS integer
    AS '$libdir/postgis-1.4', 'LWGEOM_getSRID'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: gettransactionid(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION gettransactionid() RETURNS xid
    AS '$libdir/postgis-1.4', 'getTransactionID'
    LANGUAGE c;


--
-- Name: hasbbox(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION hasbbox(geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'LWGEOM_hasBBOX'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: height(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION height(chip) RETURNS integer
    AS '$libdir/postgis-1.4', 'CHIP_getHeight'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: histogram2d_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION histogram2d_in(cstring) RETURNS histogram2d
    AS '$libdir/liblwgeom', 'lwhistogram2d_in'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: histogram2d_out(histogram2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION histogram2d_out(histogram2d) RETURNS cstring
    AS '$libdir/liblwgeom', 'lwhistogram2d_out'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: interiorringn(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION interiorringn(geometry, integer) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_interiorringn_polygon'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: intersection(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION intersection(geometry, geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'intersection'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: intersects(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION intersects(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'intersects'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: isclosed(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isclosed(geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'LWGEOM_isclosed_linestring'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: isempty(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isempty(geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'LWGEOM_isempty'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: isring(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isring(geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'isring'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: issimple(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION issimple(geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'issimple'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: isvalid(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION isvalid(geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'isvalid'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: jtsnoop(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION jtsnoop(geometry) RETURNS geometry
    AS '$libdir/liblwgeom', 'JTSnoop'
    LANGUAGE c STRICT;


--
-- Name: length(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION length(geometry) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_length_linestring'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: length2d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION length2d(geometry) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_length2d_linestring'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: length2d_spheroid(geometry, spheroid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION length2d_spheroid(geometry, spheroid) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_length2d_ellipsoid_linestring'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: length3d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION length3d(geometry) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_length_linestring'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: length3d_spheroid(geometry, spheroid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION length3d_spheroid(geometry, spheroid) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_length_ellipsoid_linestring'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: length_spheroid(geometry, spheroid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION length_spheroid(geometry, spheroid) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_length_ellipsoid_linestring'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: line_interpolate_point(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION line_interpolate_point(geometry, double precision) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_line_interpolate_point'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: line_locate_point(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION line_locate_point(geometry, geometry) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_line_locate_point'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: line_substring(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION line_substring(geometry, double precision, double precision) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_line_substring'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: linefrommultipoint(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION linefrommultipoint(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_line_from_mpoint'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: linefromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION linefromtext(text) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1)) = 'LINESTRING'
	THEN GeomFromText($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: linefromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION linefromtext(text, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1, $2)) = 'LINESTRING'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: linefromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION linefromwkb(bytea, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'LINESTRING'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: linefromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION linefromwkb(bytea) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'LINESTRING'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: linemerge(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION linemerge(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'linemerge'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: linestringfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION linestringfromtext(text) RETURNS geometry
    AS $_$SELECT LineFromText($1)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: linestringfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION linestringfromtext(text, integer) RETURNS geometry
    AS $_$SELECT LineFromText($1, $2)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: linestringfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION linestringfromwkb(bytea, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'LINESTRING'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: linestringfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION linestringfromwkb(bytea) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'LINESTRING'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: locate_along_measure(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION locate_along_measure(geometry, double precision) RETURNS geometry
    AS $_$ SELECT locate_between_measures($1, $2, $2) $_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: locate_between_measures(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION locate_between_measures(geometry, double precision, double precision) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_locate_between_m'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: lockrow(text, text, text, text, timestamp without time zone); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lockrow(text, text, text, text, timestamp without time zone) RETURNS integer
    AS $_$ 
DECLARE
	myschema alias for $1;
	mytable alias for $2;
	myrid   alias for $3;
	authid alias for $4;
	expires alias for $5;
	ret int;
	mytoid oid;
	myrec RECORD;
	
BEGIN

	IF NOT LongTransactionsEnabled() THEN
		RAISE EXCEPTION 'Long transaction support disabled, use EnableLongTransaction() to enable.';
	END IF;

	EXECUTE 'DELETE FROM authorization_table WHERE expires < now()'; 

	SELECT c.oid INTO mytoid FROM pg_class c, pg_namespace n
		WHERE c.relname = mytable
		AND c.relnamespace = n.oid
		AND n.nspname = myschema;

	-- RAISE NOTICE 'toid: %', mytoid;

	FOR myrec IN SELECT * FROM authorization_table WHERE 
		toid = mytoid AND rid = myrid
	LOOP
		IF myrec.authid != authid THEN
			RETURN 0;
		ELSE
			RETURN 1;
		END IF;
	END LOOP;

	EXECUTE 'INSERT INTO authorization_table VALUES ('||
		quote_literal(mytoid::text)||','||quote_literal(myrid)||
		','||quote_literal(expires::text)||
		','||quote_literal(authid) ||')';

	GET DIAGNOSTICS ret = ROW_COUNT;

	RETURN ret;
END;
$_$
    LANGUAGE plpgsql STRICT;


--
-- Name: lockrow(text, text, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lockrow(text, text, text, text) RETURNS integer
    AS $_$ SELECT LockRow($1, $2, $3, $4, now()::timestamp+'1:00'); $_$
    LANGUAGE sql STRICT;


--
-- Name: lockrow(text, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lockrow(text, text, text) RETURNS integer
    AS $_$ SELECT LockRow(current_schema(), $1, $2, $3, now()::timestamp+'1:00'); $_$
    LANGUAGE sql STRICT;


--
-- Name: lockrow(text, text, text, timestamp without time zone); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lockrow(text, text, text, timestamp without time zone) RETURNS integer
    AS $_$ SELECT LockRow(current_schema(), $1, $2, $3, $4); $_$
    LANGUAGE sql STRICT;


--
-- Name: longtransactionsenabled(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION longtransactionsenabled() RETURNS boolean
    AS $$ 
DECLARE
	rec RECORD;
BEGIN
	FOR rec IN SELECT oid FROM pg_class WHERE relname = 'authorized_tables'
	LOOP
		return 't';
	END LOOP;
	return 'f';
END;
$$
    LANGUAGE plpgsql;


--
-- Name: lwgeom_gist_compress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lwgeom_gist_compress(internal) RETURNS internal
    AS '$libdir/postgis-1.4', 'LWGEOM_gist_compress'
    LANGUAGE c;


--
-- Name: lwgeom_gist_consistent(internal, geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lwgeom_gist_consistent(internal, geometry, integer) RETURNS boolean
    AS '$libdir/postgis-1.4', 'LWGEOM_gist_consistent'
    LANGUAGE c;


--
-- Name: lwgeom_gist_decompress(internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lwgeom_gist_decompress(internal) RETURNS internal
    AS '$libdir/postgis-1.4', 'LWGEOM_gist_decompress'
    LANGUAGE c;


--
-- Name: lwgeom_gist_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lwgeom_gist_penalty(internal, internal, internal) RETURNS internal
    AS '$libdir/postgis-1.4', 'LWGEOM_gist_penalty'
    LANGUAGE c;


--
-- Name: lwgeom_gist_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lwgeom_gist_picksplit(internal, internal) RETURNS internal
    AS '$libdir/postgis-1.4', 'LWGEOM_gist_picksplit'
    LANGUAGE c;


--
-- Name: lwgeom_gist_same(box2d, box2d, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lwgeom_gist_same(box2d, box2d, internal) RETURNS internal
    AS '$libdir/postgis-1.4', 'LWGEOM_gist_same'
    LANGUAGE c;


--
-- Name: lwgeom_gist_union(bytea, internal); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION lwgeom_gist_union(bytea, internal) RETURNS internal
    AS '$libdir/postgis-1.4', 'LWGEOM_gist_union'
    LANGUAGE c;


--
-- Name: m(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION m(geometry) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_m_point'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: makebox2d(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION makebox2d(geometry, geometry) RETURNS box2d
    AS '$libdir/postgis-1.4', 'BOX2DFLOAT4_construct'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: makebox3d(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION makebox3d(geometry, geometry) RETURNS box3d
    AS '$libdir/postgis-1.4', 'BOX3D_construct'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: makeline(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION makeline(geometry, geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_makeline'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: makeline_garray(geometry[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION makeline_garray(geometry[]) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_makeline_garray'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: makepoint(double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION makepoint(double precision, double precision) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_makepoint'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: makepoint(double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION makepoint(double precision, double precision, double precision) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_makepoint'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: makepoint(double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION makepoint(double precision, double precision, double precision, double precision) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_makepoint'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: makepointm(double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION makepointm(double precision, double precision, double precision) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_makepoint3dm'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: makepolygon(geometry, geometry[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION makepolygon(geometry, geometry[]) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_makepoly'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: makepolygon(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION makepolygon(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_makepoly'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: max_distance(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION max_distance(geometry, geometry) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_maxdistance2d_linestring'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: mem_size(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION mem_size(geometry) RETURNS integer
    AS '$libdir/postgis-1.4', 'LWGEOM_mem_size'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: mlinefromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION mlinefromtext(text, integer) RETURNS geometry
    AS $_$
	SELECT CASE
	WHEN geometrytype(GeomFromText($1, $2)) = 'MULTILINESTRING'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: mlinefromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION mlinefromtext(text) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1)) = 'MULTILINESTRING'
	THEN GeomFromText($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: mlinefromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION mlinefromwkb(bytea, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'MULTILINESTRING'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: mlinefromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION mlinefromwkb(bytea) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'MULTILINESTRING'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: mpointfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION mpointfromtext(text, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1,$2)) = 'MULTIPOINT'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: mpointfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION mpointfromtext(text) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1)) = 'MULTIPOINT'
	THEN GeomFromText($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: mpointfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION mpointfromwkb(bytea, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1,$2)) = 'MULTIPOINT'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: mpointfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION mpointfromwkb(bytea) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'MULTIPOINT'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: mpolyfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION mpolyfromtext(text, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1, $2)) = 'MULTIPOLYGON'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: mpolyfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION mpolyfromtext(text) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1)) = 'MULTIPOLYGON'
	THEN GeomFromText($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: mpolyfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION mpolyfromwkb(bytea, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'MULTIPOLYGON'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: mpolyfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION mpolyfromwkb(bytea) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'MULTIPOLYGON'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: multi(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION multi(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_force_multi'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: multilinefromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION multilinefromwkb(bytea, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'MULTILINESTRING'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: multilinefromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION multilinefromwkb(bytea) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'MULTILINESTRING'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: multilinestringfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION multilinestringfromtext(text) RETURNS geometry
    AS $_$SELECT ST_MLineFromText($1)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: multilinestringfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION multilinestringfromtext(text, integer) RETURNS geometry
    AS $_$SELECT MLineFromText($1, $2)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: multipointfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION multipointfromtext(text, integer) RETURNS geometry
    AS $_$SELECT MPointFromText($1, $2)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: multipointfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION multipointfromtext(text) RETURNS geometry
    AS $_$SELECT MPointFromText($1)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: multipointfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION multipointfromwkb(bytea, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1,$2)) = 'MULTIPOINT'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: multipointfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION multipointfromwkb(bytea) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'MULTIPOINT'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: multipolyfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION multipolyfromwkb(bytea, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'MULTIPOLYGON'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: multipolyfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION multipolyfromwkb(bytea) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'MULTIPOLYGON'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: multipolygonfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION multipolygonfromtext(text, integer) RETURNS geometry
    AS $_$SELECT MPolyFromText($1, $2)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: multipolygonfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION multipolygonfromtext(text) RETURNS geometry
    AS $_$SELECT MPolyFromText($1)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: ndims(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ndims(geometry) RETURNS smallint
    AS '$libdir/postgis-1.4', 'LWGEOM_ndims'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: noop(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION noop(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_noop'
    LANGUAGE c STRICT;


--
-- Name: npoints(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION npoints(geometry) RETURNS integer
    AS '$libdir/postgis-1.4', 'LWGEOM_npoints'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: nrings(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION nrings(geometry) RETURNS integer
    AS '$libdir/postgis-1.4', 'LWGEOM_nrings'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: numgeometries(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION numgeometries(geometry) RETURNS integer
    AS '$libdir/postgis-1.4', 'LWGEOM_numgeometries_collection'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: numinteriorring(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION numinteriorring(geometry) RETURNS integer
    AS '$libdir/postgis-1.4', 'LWGEOM_numinteriorrings_polygon'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: numinteriorrings(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION numinteriorrings(geometry) RETURNS integer
    AS '$libdir/postgis-1.4', 'LWGEOM_numinteriorrings_polygon'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: numpoints(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION numpoints(geometry) RETURNS integer
    AS '$libdir/postgis-1.4', 'LWGEOM_numpoints_linestring'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: overlaps(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION "overlaps"(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'overlaps'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: perimeter(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION perimeter(geometry) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_perimeter_poly'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: perimeter2d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION perimeter2d(geometry) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_perimeter2d_poly'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: perimeter3d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION perimeter3d(geometry) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_perimeter_poly'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: pgis_geometry_accum_finalfn(pgis_abs); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pgis_geometry_accum_finalfn(pgis_abs) RETURNS geometry[]
    AS '$libdir/postgis-1.4', 'pgis_geometry_accum_finalfn'
    LANGUAGE c;


--
-- Name: pgis_geometry_accum_transfn(pgis_abs, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pgis_geometry_accum_transfn(pgis_abs, geometry) RETURNS pgis_abs
    AS '$libdir/postgis-1.4', 'pgis_geometry_accum_transfn'
    LANGUAGE c;


--
-- Name: pgis_geometry_collect_finalfn(pgis_abs); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pgis_geometry_collect_finalfn(pgis_abs) RETURNS geometry
    AS '$libdir/postgis-1.4', 'pgis_geometry_collect_finalfn'
    LANGUAGE c;


--
-- Name: pgis_geometry_makeline_finalfn(pgis_abs); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pgis_geometry_makeline_finalfn(pgis_abs) RETURNS geometry
    AS '$libdir/postgis-1.4', 'pgis_geometry_makeline_finalfn'
    LANGUAGE c;


--
-- Name: pgis_geometry_polygonize_finalfn(pgis_abs); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pgis_geometry_polygonize_finalfn(pgis_abs) RETURNS geometry
    AS '$libdir/postgis-1.4', 'pgis_geometry_polygonize_finalfn'
    LANGUAGE c;


--
-- Name: pgis_geometry_union_finalfn(pgis_abs); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pgis_geometry_union_finalfn(pgis_abs) RETURNS geometry
    AS '$libdir/postgis-1.4', 'pgis_geometry_union_finalfn'
    LANGUAGE c;


--
-- Name: point_inside_circle(geometry, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION point_inside_circle(geometry, double precision, double precision, double precision) RETURNS boolean
    AS '$libdir/postgis-1.4', 'LWGEOM_inside_circle_point'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: pointfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pointfromtext(text) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1)) = 'POINT'
	THEN GeomFromText($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: pointfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pointfromtext(text, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1, $2)) = 'POINT'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: pointfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pointfromwkb(bytea, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'POINT'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: pointfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pointfromwkb(bytea) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'POINT'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: pointn(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pointn(geometry, integer) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_pointn_linestring'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: pointonsurface(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION pointonsurface(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'pointonsurface'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: polyfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION polyfromtext(text) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1)) = 'POLYGON'
	THEN GeomFromText($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: polyfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION polyfromtext(text, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1, $2)) = 'POLYGON'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: polyfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION polyfromwkb(bytea, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'POLYGON'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: polyfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION polyfromwkb(bytea) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'POLYGON'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: polygonfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION polygonfromtext(text, integer) RETURNS geometry
    AS $_$SELECT PolyFromText($1, $2)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: polygonfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION polygonfromtext(text) RETURNS geometry
    AS $_$SELECT PolyFromText($1)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: polygonfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION polygonfromwkb(bytea, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1,$2)) = 'POLYGON'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: polygonfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION polygonfromwkb(bytea) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'POLYGON'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: polygonize_garray(geometry[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION polygonize_garray(geometry[]) RETURNS geometry
    AS '$libdir/postgis-1.4', 'polygonize_garray'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: populate_geometry_columns(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION populate_geometry_columns() RETURNS text
    AS $$
DECLARE
	inserted    integer;
	oldcount    integer;
	probed      integer;
	stale       integer;
	gcs         RECORD;
	gc          RECORD;
	gsrid       integer;
	gndims      integer;
	gtype       text;
	query       text;
	gc_is_valid boolean;
	
BEGIN
	SELECT count(*) INTO oldcount FROM geometry_columns;
	inserted := 0;

	EXECUTE 'TRUNCATE geometry_columns';

	-- Count the number of geometry columns in all tables and views
	SELECT count(DISTINCT c.oid) INTO probed
	FROM pg_class c, 
	     pg_attribute a, 
	     pg_type t, 
	     pg_namespace n
	WHERE (c.relkind = 'r' OR c.relkind = 'v')
	AND t.typname = 'geometry'
	AND a.attisdropped = false
	AND a.atttypid = t.oid
	AND a.attrelid = c.oid
	AND c.relnamespace = n.oid
	AND n.nspname NOT ILIKE 'pg_temp%';

	-- Iterate through all non-dropped geometry columns
	RAISE DEBUG 'Processing Tables.....';

	FOR gcs IN 
	SELECT DISTINCT ON (c.oid) c.oid, n.nspname, c.relname
	    FROM pg_class c, 
	         pg_attribute a, 
	         pg_type t, 
	         pg_namespace n
	    WHERE c.relkind = 'r'
	    AND t.typname = 'geometry'
	    AND a.attisdropped = false
	    AND a.atttypid = t.oid
	    AND a.attrelid = c.oid
	    AND c.relnamespace = n.oid
	    AND n.nspname NOT ILIKE 'pg_temp%'
	LOOP
	
	inserted := inserted + populate_geometry_columns(gcs.oid);
	END LOOP;
	
	-- Add views to geometry columns table
	RAISE DEBUG 'Processing Views.....';
	FOR gcs IN 
	SELECT DISTINCT ON (c.oid) c.oid, n.nspname, c.relname
	    FROM pg_class c, 
	         pg_attribute a, 
	         pg_type t, 
	         pg_namespace n
	    WHERE c.relkind = 'v'
	    AND t.typname = 'geometry'
	    AND a.attisdropped = false
	    AND a.atttypid = t.oid
	    AND a.attrelid = c.oid
	    AND c.relnamespace = n.oid
	LOOP            
	    
	inserted := inserted + populate_geometry_columns(gcs.oid);
	END LOOP;

	IF oldcount > inserted THEN
	stale = oldcount-inserted;
	ELSE
	stale = 0;
	END IF;

	RETURN 'probed:' ||probed|| ' inserted:'||inserted|| ' conflicts:'||probed-inserted|| ' deleted:'||stale;
END

$$
    LANGUAGE plpgsql;


--
-- Name: populate_geometry_columns(oid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION populate_geometry_columns(tbl_oid oid) RETURNS integer
    AS $$
DECLARE
	gcs         RECORD;
	gc          RECORD;
	gsrid       integer;
	gndims      integer;
	gtype       text;
	query       text;
	gc_is_valid boolean;
	inserted    integer;
	
BEGIN
	inserted := 0;
	
	-- Iterate through all geometry columns in this table
	FOR gcs IN 
	SELECT n.nspname, c.relname, a.attname
	    FROM pg_class c, 
	         pg_attribute a, 
	         pg_type t, 
	         pg_namespace n
	    WHERE c.relkind = 'r'
	    AND t.typname = 'geometry'
	    AND a.attisdropped = false
	    AND a.atttypid = t.oid
	    AND a.attrelid = c.oid
	    AND c.relnamespace = n.oid
	    AND n.nspname NOT ILIKE 'pg_temp%'
	    AND c.oid = tbl_oid
	LOOP
	
	RAISE DEBUG 'Processing table %.%.%', gcs.nspname, gcs.relname, gcs.attname;

	DELETE FROM geometry_columns 
	  WHERE f_table_schema = quote_ident(gcs.nspname) 
	  AND f_table_name = quote_ident(gcs.relname)
	  AND f_geometry_column = quote_ident(gcs.attname);
	
	gc_is_valid := true;
	
	-- Try to find srid check from system tables (pg_constraint)
	gsrid := 
	    (SELECT replace(replace(split_part(s.consrc, ' = ', 2), ')', ''), '(', '') 
	     FROM pg_class c, pg_namespace n, pg_attribute a, pg_constraint s 
	     WHERE n.nspname = gcs.nspname 
	     AND c.relname = gcs.relname 
	     AND a.attname = gcs.attname 
	     AND a.attrelid = c.oid
	     AND s.connamespace = n.oid
	     AND s.conrelid = c.oid
	     AND a.attnum = ANY (s.conkey)
	     AND s.consrc LIKE '%srid(% = %');
	IF (gsrid IS NULL) THEN 
	    -- Try to find srid from the geometry itself
	    EXECUTE 'SELECT public.srid(' || quote_ident(gcs.attname) || ') 
	             FROM ONLY ' || quote_ident(gcs.nspname) || '.' || quote_ident(gcs.relname) || ' 
	             WHERE ' || quote_ident(gcs.attname) || ' IS NOT NULL LIMIT 1' 
	        INTO gc;
	    gsrid := gc.srid;
	    
	    -- Try to apply srid check to column
	    IF (gsrid IS NOT NULL) THEN
	        BEGIN
	            EXECUTE 'ALTER TABLE ONLY ' || quote_ident(gcs.nspname) || '.' || quote_ident(gcs.relname) || ' 
	                     ADD CONSTRAINT ' || quote_ident('enforce_srid_' || gcs.attname) || ' 
	                     CHECK (srid(' || quote_ident(gcs.attname) || ') = ' || gsrid || ')';
	        EXCEPTION
	            WHEN check_violation THEN
	                RAISE WARNING 'Not inserting ''%'' in ''%.%'' into geometry_columns: could not apply constraint CHECK (srid(%) = %)', quote_ident(gcs.attname), quote_ident(gcs.nspname), quote_ident(gcs.relname), quote_ident(gcs.attname), gsrid;
	                gc_is_valid := false;
	        END;
	    END IF;
	END IF;
	
	-- Try to find ndims check from system tables (pg_constraint)
	gndims := 
	    (SELECT replace(split_part(s.consrc, ' = ', 2), ')', '') 
	     FROM pg_class c, pg_namespace n, pg_attribute a, pg_constraint s 
	     WHERE n.nspname = gcs.nspname 
	     AND c.relname = gcs.relname 
	     AND a.attname = gcs.attname 
	     AND a.attrelid = c.oid
	     AND s.connamespace = n.oid
	     AND s.conrelid = c.oid
	     AND a.attnum = ANY (s.conkey)
	     AND s.consrc LIKE '%ndims(% = %');
	IF (gndims IS NULL) THEN
	    -- Try to find ndims from the geometry itself
	    EXECUTE 'SELECT public.ndims(' || quote_ident(gcs.attname) || ') 
	             FROM ONLY ' || quote_ident(gcs.nspname) || '.' || quote_ident(gcs.relname) || ' 
	             WHERE ' || quote_ident(gcs.attname) || ' IS NOT NULL LIMIT 1' 
	        INTO gc;
	    gndims := gc.ndims;
	    
	    -- Try to apply ndims check to column
	    IF (gndims IS NOT NULL) THEN
	        BEGIN
	            EXECUTE 'ALTER TABLE ONLY ' || quote_ident(gcs.nspname) || '.' || quote_ident(gcs.relname) || ' 
	                     ADD CONSTRAINT ' || quote_ident('enforce_dims_' || gcs.attname) || ' 
	                     CHECK (ndims(' || quote_ident(gcs.attname) || ') = '||gndims||')';
	        EXCEPTION
	            WHEN check_violation THEN
	                RAISE WARNING 'Not inserting ''%'' in ''%.%'' into geometry_columns: could not apply constraint CHECK (ndims(%) = %)', quote_ident(gcs.attname), quote_ident(gcs.nspname), quote_ident(gcs.relname), quote_ident(gcs.attname), gndims;
	                gc_is_valid := false;
	        END;
	    END IF;
	END IF;
	
	-- Try to find geotype check from system tables (pg_constraint)
	gtype := 
	    (SELECT replace(split_part(s.consrc, '''', 2), ')', '') 
	     FROM pg_class c, pg_namespace n, pg_attribute a, pg_constraint s 
	     WHERE n.nspname = gcs.nspname 
	     AND c.relname = gcs.relname 
	     AND a.attname = gcs.attname 
	     AND a.attrelid = c.oid
	     AND s.connamespace = n.oid
	     AND s.conrelid = c.oid
	     AND a.attnum = ANY (s.conkey)
	     AND s.consrc LIKE '%geometrytype(% = %');
	IF (gtype IS NULL) THEN
	    -- Try to find geotype from the geometry itself
	    EXECUTE 'SELECT public.geometrytype(' || quote_ident(gcs.attname) || ') 
	             FROM ONLY ' || quote_ident(gcs.nspname) || '.' || quote_ident(gcs.relname) || ' 
	             WHERE ' || quote_ident(gcs.attname) || ' IS NOT NULL LIMIT 1' 
	        INTO gc;
	    gtype := gc.geometrytype;
	    --IF (gtype IS NULL) THEN
	    --    gtype := 'GEOMETRY';
	    --END IF;
	    
	    -- Try to apply geometrytype check to column
	    IF (gtype IS NOT NULL) THEN
	        BEGIN
	            EXECUTE 'ALTER TABLE ONLY ' || quote_ident(gcs.nspname) || '.' || quote_ident(gcs.relname) || ' 
	            ADD CONSTRAINT ' || quote_ident('enforce_geotype_' || gcs.attname) || ' 
	            CHECK ((geometrytype(' || quote_ident(gcs.attname) || ') = ' || quote_literal(gtype) || ') OR (' || quote_ident(gcs.attname) || ' IS NULL))';
	        EXCEPTION
	            WHEN check_violation THEN
	                -- No geometry check can be applied. This column contains a number of geometry types.
	                RAISE WARNING 'Could not add geometry type check (%) to table column: %.%.%', gtype, quote_ident(gcs.nspname),quote_ident(gcs.relname),quote_ident(gcs.attname);
	        END;
	    END IF;
	END IF;
	        
	IF (gsrid IS NULL) THEN             
	    RAISE WARNING 'Not inserting ''%'' in ''%.%'' into geometry_columns: could not determine the srid', quote_ident(gcs.attname), quote_ident(gcs.nspname), quote_ident(gcs.relname);
	ELSIF (gndims IS NULL) THEN
	    RAISE WARNING 'Not inserting ''%'' in ''%.%'' into geometry_columns: could not determine the number of dimensions', quote_ident(gcs.attname), quote_ident(gcs.nspname), quote_ident(gcs.relname);
	ELSIF (gtype IS NULL) THEN
	    RAISE WARNING 'Not inserting ''%'' in ''%.%'' into geometry_columns: could not determine the geometry type', quote_ident(gcs.attname), quote_ident(gcs.nspname), quote_ident(gcs.relname);
	ELSE
	    -- Only insert into geometry_columns if table constraints could be applied.
	    IF (gc_is_valid) THEN
	        INSERT INTO geometry_columns (f_table_catalog,f_table_schema, f_table_name, f_geometry_column, coord_dimension, srid, type) 
	        VALUES ('', gcs.nspname, gcs.relname, gcs.attname, gndims, gsrid, gtype);
	        inserted := inserted + 1;
	    END IF;
	END IF;
	END LOOP;

	-- Add views to geometry columns table
	FOR gcs IN 
	SELECT n.nspname, c.relname, a.attname
	    FROM pg_class c, 
	         pg_attribute a, 
	         pg_type t, 
	         pg_namespace n
	    WHERE c.relkind = 'v'
	    AND t.typname = 'geometry'
	    AND a.attisdropped = false
	    AND a.atttypid = t.oid
	    AND a.attrelid = c.oid
	    AND c.relnamespace = n.oid
	    AND n.nspname NOT ILIKE 'pg_temp%'
	    AND c.oid = tbl_oid
	LOOP            
	    RAISE DEBUG 'Processing view %.%.%', gcs.nspname, gcs.relname, gcs.attname;

	    EXECUTE 'SELECT public.ndims(' || quote_ident(gcs.attname) || ') 
	             FROM ' || quote_ident(gcs.nspname) || '.' || quote_ident(gcs.relname) || ' 
	             WHERE ' || quote_ident(gcs.attname) || ' IS NOT NULL LIMIT 1' 
	        INTO gc;
	    gndims := gc.ndims;
	    
	    EXECUTE 'SELECT public.srid(' || quote_ident(gcs.attname) || ') 
	             FROM ' || quote_ident(gcs.nspname) || '.' || quote_ident(gcs.relname) || ' 
	             WHERE ' || quote_ident(gcs.attname) || ' IS NOT NULL LIMIT 1' 
	        INTO gc;
	    gsrid := gc.srid;
	    
	    EXECUTE 'SELECT public.geometrytype(' || quote_ident(gcs.attname) || ') 
	             FROM ' || quote_ident(gcs.nspname) || '.' || quote_ident(gcs.relname) || ' 
	             WHERE ' || quote_ident(gcs.attname) || ' IS NOT NULL LIMIT 1' 
	        INTO gc;
	    gtype := gc.geometrytype;
	    
	    IF (gndims IS NULL) THEN
	        RAISE WARNING 'Not inserting ''%'' in ''%.%'' into geometry_columns: could not determine ndims', quote_ident(gcs.attname), quote_ident(gcs.nspname), quote_ident(gcs.relname);
	    ELSIF (gsrid IS NULL) THEN
	        RAISE WARNING 'Not inserting ''%'' in ''%.%'' into geometry_columns: could not determine srid', quote_ident(gcs.attname), quote_ident(gcs.nspname), quote_ident(gcs.relname);
	    ELSIF (gtype IS NULL) THEN
	        RAISE WARNING 'Not inserting ''%'' in ''%.%'' into geometry_columns: could not determine gtype', quote_ident(gcs.attname), quote_ident(gcs.nspname), quote_ident(gcs.relname);
	    ELSE
	        query := 'INSERT INTO geometry_columns (f_table_catalog,f_table_schema, f_table_name, f_geometry_column, coord_dimension, srid, type) ' ||
	                 'VALUES ('''', ' || quote_literal(gcs.nspname) || ',' || quote_literal(gcs.relname) || ',' || quote_literal(gcs.attname) || ',' || gndims || ',' || gsrid || ',' || quote_literal(gtype) || ')';
	        EXECUTE query;
	        inserted := inserted + 1;
	    END IF;
	END LOOP;
	
	RETURN inserted;
END

$$
    LANGUAGE plpgsql;


--
-- Name: postgis_full_version(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_full_version() RETURNS text
    AS $$ 
DECLARE
	libver text;
	projver text;
	geosver text;
	usestats bool;
	dbproc text;
	relproc text;
	fullver text;
BEGIN
	SELECT postgis_lib_version() INTO libver;
	SELECT postgis_proj_version() INTO projver;
	SELECT postgis_geos_version() INTO geosver;
	SELECT postgis_uses_stats() INTO usestats;
	SELECT postgis_scripts_installed() INTO dbproc;
	SELECT postgis_scripts_released() INTO relproc;

	fullver = 'POSTGIS="' || libver || '"';

	IF  geosver IS NOT NULL THEN
		fullver = fullver || ' GEOS="' || geosver || '"';
	END IF;

	IF  projver IS NOT NULL THEN
		fullver = fullver || ' PROJ="' || projver || '"';
	END IF;

	IF usestats THEN
		fullver = fullver || ' USE_STATS';
	END IF;

	-- fullver = fullver || ' DBPROC="' || dbproc || '"';
	-- fullver = fullver || ' RELPROC="' || relproc || '"';

	IF dbproc != relproc THEN
		fullver = fullver || ' (procs from ' || dbproc || ' need upgrade)';
	END IF;

	RETURN fullver;
END
$$
    LANGUAGE plpgsql IMMUTABLE;


--
-- Name: postgis_geos_version(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_geos_version() RETURNS text
    AS '$libdir/postgis-1.4', 'postgis_geos_version'
    LANGUAGE c IMMUTABLE;


--
-- Name: postgis_gist_joinsel(internal, oid, internal, smallint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_gist_joinsel(internal, oid, internal, smallint) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_gist_joinsel'
    LANGUAGE c;


--
-- Name: postgis_gist_sel(internal, oid, internal, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_gist_sel(internal, oid, internal, integer) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_gist_sel'
    LANGUAGE c;


--
-- Name: postgis_jts_version(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_jts_version() RETURNS text
    AS '$libdir/liblwgeom', 'postgis_jts_version'
    LANGUAGE c IMMUTABLE;


--
-- Name: postgis_lib_build_date(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_lib_build_date() RETURNS text
    AS '$libdir/postgis-1.4', 'postgis_lib_build_date'
    LANGUAGE c IMMUTABLE;


--
-- Name: postgis_lib_version(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_lib_version() RETURNS text
    AS '$libdir/postgis-1.4', 'postgis_lib_version'
    LANGUAGE c IMMUTABLE;


--
-- Name: postgis_proj_version(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_proj_version() RETURNS text
    AS '$libdir/postgis-1.4', 'postgis_proj_version'
    LANGUAGE c IMMUTABLE;


--
-- Name: postgis_scripts_build_date(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_scripts_build_date() RETURNS text
    AS $$SELECT '2009-08-08 18:52:20'::text AS version$$
    LANGUAGE sql IMMUTABLE;


--
-- Name: postgis_scripts_installed(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_scripts_installed() RETURNS text
    AS $$SELECT '1.4.0'::text AS version$$
    LANGUAGE sql IMMUTABLE;


--
-- Name: postgis_scripts_released(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_scripts_released() RETURNS text
    AS '$libdir/postgis-1.4', 'postgis_scripts_released'
    LANGUAGE c IMMUTABLE;


--
-- Name: postgis_uses_stats(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_uses_stats() RETURNS boolean
    AS '$libdir/postgis-1.4', 'postgis_uses_stats'
    LANGUAGE c IMMUTABLE;


--
-- Name: postgis_version(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION postgis_version() RETURNS text
    AS '$libdir/postgis-1.4', 'postgis_version'
    LANGUAGE c IMMUTABLE;


--
-- Name: probe_geometry_columns(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION probe_geometry_columns() RETURNS text
    AS $$
DECLARE
	inserted integer;
	oldcount integer;
	probed integer;
	stale integer;
BEGIN

	SELECT count(*) INTO oldcount FROM geometry_columns;

	SELECT count(*) INTO probed
		FROM pg_class c, pg_attribute a, pg_type t, 
			pg_namespace n,
			pg_constraint sridcheck, pg_constraint typecheck

		WHERE t.typname = 'geometry'
		AND a.atttypid = t.oid
		AND a.attrelid = c.oid
		AND c.relnamespace = n.oid
		AND sridcheck.connamespace = n.oid
		AND typecheck.connamespace = n.oid
		AND sridcheck.conrelid = c.oid
		AND sridcheck.consrc LIKE '(srid('||a.attname||') = %)'
		AND typecheck.conrelid = c.oid
		AND typecheck.consrc LIKE
		'((geometrytype('||a.attname||') = ''%''::text) OR (% IS NULL))'
		;

	INSERT INTO geometry_columns SELECT
		''::varchar as f_table_catalogue,
		n.nspname::varchar as f_table_schema,
		c.relname::varchar as f_table_name,
		a.attname::varchar as f_geometry_column,
		2 as coord_dimension,
		trim(both  ' =)' from 
			replace(replace(split_part(
				sridcheck.consrc, ' = ', 2), ')', ''), '(', ''))::integer AS srid,
		trim(both ' =)''' from substr(typecheck.consrc, 
			strpos(typecheck.consrc, '='),
			strpos(typecheck.consrc, '::')-
			strpos(typecheck.consrc, '=')
			))::varchar as type
		FROM pg_class c, pg_attribute a, pg_type t, 
			pg_namespace n,
			pg_constraint sridcheck, pg_constraint typecheck
		WHERE t.typname = 'geometry'
		AND a.atttypid = t.oid
		AND a.attrelid = c.oid
		AND c.relnamespace = n.oid
		AND sridcheck.connamespace = n.oid
		AND typecheck.connamespace = n.oid
		AND sridcheck.conrelid = c.oid
		AND sridcheck.consrc LIKE '(st_srid('||a.attname||') = %)'
		AND typecheck.conrelid = c.oid
		AND typecheck.consrc LIKE
		'((geometrytype('||a.attname||') = ''%''::text) OR (% IS NULL))'

	        AND NOT EXISTS (
	                SELECT oid FROM geometry_columns gc
	                WHERE c.relname::varchar = gc.f_table_name
	                AND n.nspname::varchar = gc.f_table_schema
	                AND a.attname::varchar = gc.f_geometry_column
	        );

	GET DIAGNOSTICS inserted = ROW_COUNT;

	IF oldcount > probed THEN
		stale = oldcount-probed;
	ELSE
		stale = 0;
	END IF;

	RETURN 'probed:'||probed::text||
		' inserted:'||inserted::text||
		' conflicts:'||(probed-inserted)::text||
		' stale:'||stale::text;
END

$$
    LANGUAGE plpgsql;


--
-- Name: relate(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION relate(geometry, geometry) RETURNS text
    AS '$libdir/postgis-1.4', 'relate_full'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: relate(geometry, geometry, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION relate(geometry, geometry, text) RETURNS boolean
    AS '$libdir/postgis-1.4', 'relate_pattern'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: removepoint(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION removepoint(geometry, integer) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_removepoint'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: rename_geometry_table_constraints(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION rename_geometry_table_constraints() RETURNS text
    AS $$
SELECT 'rename_geometry_table_constraint() is obsoleted'::text
$$
    LANGUAGE sql IMMUTABLE;


--
-- Name: reverse(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION reverse(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_reverse'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: rotate(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION rotate(geometry, double precision) RETURNS geometry
    AS $_$SELECT rotateZ($1, $2)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: rotatex(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION rotatex(geometry, double precision) RETURNS geometry
    AS $_$SELECT affine($1, 1, 0, 0, 0, cos($2), -sin($2), 0, sin($2), cos($2), 0, 0, 0)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: rotatey(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION rotatey(geometry, double precision) RETURNS geometry
    AS $_$SELECT affine($1,  cos($2), 0, sin($2),  0, 1, 0,  -sin($2), 0, cos($2), 0,  0, 0)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: rotatez(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION rotatez(geometry, double precision) RETURNS geometry
    AS $_$SELECT affine($1,  cos($2), -sin($2), 0,  sin($2), cos($2), 0,  0, 0, 1,  0, 0, 0)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: scale(geometry, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION scale(geometry, double precision, double precision, double precision) RETURNS geometry
    AS $_$SELECT affine($1,  $2, 0, 0,  0, $3, 0,  0, 0, $4,  0, 0, 0)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: scale(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION scale(geometry, double precision, double precision) RETURNS geometry
    AS $_$SELECT scale($1, $2, $3, 1)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: se_envelopesintersect(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION se_envelopesintersect(geometry, geometry) RETURNS boolean
    AS $_$ 
	SELECT $1 && $2
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: se_is3d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION se_is3d(geometry) RETURNS boolean
    AS $_$ 
	SELECT CASE ST_zmflag($1)
	       WHEN 0 THEN false
	       WHEN 1 THEN false
	       WHEN 2 THEN true
	       WHEN 3 THEN true
	       ELSE false
	   END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: se_ismeasured(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION se_ismeasured(geometry) RETURNS boolean
    AS $_$ 
	SELECT CASE ST_zmflag($1)
	       WHEN 0 THEN false
	       WHEN 1 THEN true
	       WHEN 2 THEN false
	       WHEN 3 THEN true
	       ELSE false
	   END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: se_locatealong(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION se_locatealong(geometry, double precision) RETURNS geometry
    AS $_$ SELECT locate_between_measures($1, $2, $2) $_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: se_locatebetween(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION se_locatebetween(geometry, double precision, double precision) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_locate_between_m'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: se_m(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION se_m(geometry) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_m_point'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: se_z(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION se_z(geometry) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_z_point'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: segmentize(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION segmentize(geometry, double precision) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_segmentize2d'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: setfactor(chip, real); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION setfactor(chip, real) RETURNS chip
    AS '$libdir/postgis-1.4', 'CHIP_setFactor'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: setpoint(geometry, integer, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION setpoint(geometry, integer, geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_setpoint_linestring'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: setsrid(chip, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION setsrid(chip, integer) RETURNS chip
    AS '$libdir/postgis-1.4', 'CHIP_setSRID'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: setsrid(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION setsrid(geometry, integer) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_setSRID'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: shift_longitude(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION shift_longitude(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_longitude_shift'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: simplify(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION simplify(geometry, double precision) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_simplify2d'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: snaptogrid(geometry, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION snaptogrid(geometry, double precision, double precision, double precision, double precision) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_snaptogrid'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: snaptogrid(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION snaptogrid(geometry, double precision, double precision) RETURNS geometry
    AS $_$SELECT SnapToGrid($1, 0, 0, $2, $3)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: snaptogrid(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION snaptogrid(geometry, double precision) RETURNS geometry
    AS $_$SELECT SnapToGrid($1, 0, 0, $2, $2)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: snaptogrid(geometry, geometry, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION snaptogrid(geometry, geometry, double precision, double precision, double precision, double precision) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_snaptogrid_pointoff'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: spheroid_in(cstring); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION spheroid_in(cstring) RETURNS spheroid
    AS '$libdir/postgis-1.4', 'ellipsoid_in'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: spheroid_out(spheroid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION spheroid_out(spheroid) RETURNS cstring
    AS '$libdir/postgis-1.4', 'ellipsoid_out'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: srid(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION srid(chip) RETURNS integer
    AS '$libdir/postgis-1.4', 'CHIP_getSRID'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: srid(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION srid(geometry) RETURNS integer
    AS '$libdir/postgis-1.4', 'LWGEOM_getSRID'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_addbbox(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_addbbox(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_addBBOX'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_addpoint(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_addpoint(geometry, geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_addpoint'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_addpoint(geometry, geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_addpoint(geometry, geometry, integer) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_addpoint'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_affine'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision) RETURNS geometry
    AS $_$SELECT affine($1,  $2, $3, 0,  $4, $5, 0,  0, 0, 1,  $6, $7, 0)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_area(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_area(geometry) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_area_polygon'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_area2d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_area2d(geometry) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_area_polygon'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_asbinary(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asbinary(geometry) RETURNS bytea
    AS '$libdir/postgis-1.4', 'LWGEOM_asBinary'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_asbinary(geometry, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asbinary(geometry, text) RETURNS bytea
    AS '$libdir/postgis-1.4', 'LWGEOM_asBinary'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_asewkb(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asewkb(geometry) RETURNS bytea
    AS '$libdir/postgis-1.4', 'WKBFromLWGEOM'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_asewkb(geometry, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asewkb(geometry, text) RETURNS bytea
    AS '$libdir/postgis-1.4', 'WKBFromLWGEOM'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_asewkt(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asewkt(geometry) RETURNS text
    AS '$libdir/postgis-1.4', 'LWGEOM_asEWKT'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_asgeojson(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgeojson(geometry, integer) RETURNS text
    AS $_$SELECT _ST_AsGeoJson(1, $1, $2, 0)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_asgeojson(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgeojson(geometry) RETURNS text
    AS $_$SELECT _ST_AsGeoJson(1, $1, 15, 0)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_asgeojson(integer, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgeojson(integer, geometry) RETURNS text
    AS $_$SELECT _ST_AsGeoJson($1, $2, 15, 0)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_asgeojson(integer, geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgeojson(integer, geometry, integer) RETURNS text
    AS $_$SELECT _ST_AsGeoJson($1, $2, $3, 0)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_asgeojson(geometry, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgeojson(geometry, integer, integer) RETURNS text
    AS $_$SELECT _ST_AsGeoJson(1, $1, $2, $3)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_asgeojson(integer, geometry, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgeojson(integer, geometry, integer, integer) RETURNS text
    AS $_$SELECT _ST_AsGeoJson($1, $2, $3, $4)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_asgml(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgml(geometry, integer) RETURNS text
    AS $_$SELECT _ST_AsGML(2, $1, $2, 0)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_asgml(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgml(geometry) RETURNS text
    AS $_$SELECT _ST_AsGML(2, $1, 15, 0)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_asgml(integer, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgml(integer, geometry) RETURNS text
    AS $_$SELECT _ST_AsGML($1, $2, 15, 0)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_asgml(integer, geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgml(integer, geometry, integer) RETURNS text
    AS $_$SELECT _ST_AsGML($1, $2, $3, 0)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_asgml(geometry, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgml(geometry, integer, integer) RETURNS text
    AS $_$SELECT _ST_AsGML(2, $1, $2, $3)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_asgml(integer, geometry, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_asgml(integer, geometry, integer, integer) RETURNS text
    AS $_$SELECT _ST_AsGML($1, $2, $3, $4)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_ashexewkb(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_ashexewkb(geometry) RETURNS text
    AS '$libdir/postgis-1.4', 'LWGEOM_asHEXEWKB'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_ashexewkb(geometry, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_ashexewkb(geometry, text) RETURNS text
    AS '$libdir/postgis-1.4', 'LWGEOM_asHEXEWKB'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_askml(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_askml(geometry, integer) RETURNS text
    AS $_$SELECT _ST_AsKML(2, ST_Transform($1,4326), $2)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_askml(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_askml(geometry) RETURNS text
    AS $_$SELECT _ST_AsKML(2, ST_Transform($1,4326), 15)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_askml(integer, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_askml(integer, geometry) RETURNS text
    AS $_$SELECT _ST_AsKML($1, ST_Transform($2,4326), 15)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_askml(integer, geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_askml(integer, geometry, integer) RETURNS text
    AS $_$SELECT _ST_AsKML($1, ST_Transform($2,4326), $3)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_assvg(geometry, integer, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_assvg(geometry, integer, integer) RETURNS text
    AS '$libdir/postgis-1.4', 'assvg_geometry'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_assvg(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_assvg(geometry, integer) RETURNS text
    AS '$libdir/postgis-1.4', 'assvg_geometry'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_assvg(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_assvg(geometry) RETURNS text
    AS '$libdir/postgis-1.4', 'assvg_geometry'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_astext(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_astext(geometry) RETURNS text
    AS '$libdir/postgis-1.4', 'LWGEOM_asText'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_azimuth(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_azimuth(geometry, geometry) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_azimuth'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_bdmpolyfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_bdmpolyfromtext(text, integer) RETURNS geometry
    AS $_$ 
DECLARE
	geomtext alias for $1;
	srid alias for $2;
	mline geometry;
	geom geometry;
BEGIN
	mline := ST_MultiLineStringFromText(geomtext, srid);

	IF mline IS NULL
	THEN
		RAISE EXCEPTION 'Input is not a MultiLinestring';
	END IF;

	geom := multi(ST_BuildArea(mline));

	RETURN geom;
END;
$_$
    LANGUAGE plpgsql IMMUTABLE STRICT;


--
-- Name: st_bdpolyfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_bdpolyfromtext(text, integer) RETURNS geometry
    AS $_$ 
DECLARE
	geomtext alias for $1;
	srid alias for $2;
	mline geometry;
	geom geometry;
BEGIN
	mline := ST_MultiLineStringFromText(geomtext, srid);

	IF mline IS NULL
	THEN
		RAISE EXCEPTION 'Input is not a MultiLinestring';
	END IF;

	geom := ST_BuildArea(mline);

	IF GeometryType(geom) != 'POLYGON'
	THEN
		RAISE EXCEPTION 'Input returns more then a single polygon, try using BdMPolyFromText instead';
	END IF;

	RETURN geom;
END;
$_$
    LANGUAGE plpgsql IMMUTABLE STRICT;


--
-- Name: st_boundary(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_boundary(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'boundary'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_box(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box(geometry) RETURNS box
    AS '$libdir/postgis-1.4', 'LWGEOM_to_BOX'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_box(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box(box3d) RETURNS box
    AS '$libdir/postgis-1.4', 'BOX3D_to_BOX'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_box2d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box2d(geometry) RETURNS box2d
    AS '$libdir/postgis-1.4', 'LWGEOM_to_BOX2DFLOAT4'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_box2d(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box2d(box3d) RETURNS box2d
    AS '$libdir/postgis-1.4', 'BOX3D_to_BOX2DFLOAT4'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_box2d(box3d_extent); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box2d(box3d_extent) RETURNS box2d
    AS '$libdir/postgis-1.4', 'BOX3D_to_BOX2DFLOAT4'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_box2d_contain(box2d, box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box2d_contain(box2d, box2d) RETURNS boolean
    AS '$libdir/postgis-1.4', 'BOX2D_contain'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_box2d_contained(box2d, box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box2d_contained(box2d, box2d) RETURNS boolean
    AS '$libdir/postgis-1.4', 'BOX2D_contained'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_box2d_intersects(box2d, box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box2d_intersects(box2d, box2d) RETURNS boolean
    AS '$libdir/postgis-1.4', 'BOX2D_intersects'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_box2d_left(box2d, box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box2d_left(box2d, box2d) RETURNS boolean
    AS '$libdir/postgis-1.4', 'BOX2D_left'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_box2d_overlap(box2d, box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box2d_overlap(box2d, box2d) RETURNS boolean
    AS '$libdir/postgis-1.4', 'BOX2D_overlap'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_box2d_overleft(box2d, box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box2d_overleft(box2d, box2d) RETURNS boolean
    AS '$libdir/postgis-1.4', 'BOX2D_overleft'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_box2d_overright(box2d, box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box2d_overright(box2d, box2d) RETURNS boolean
    AS '$libdir/postgis-1.4', 'BOX2D_overright'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_box2d_right(box2d, box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box2d_right(box2d, box2d) RETURNS boolean
    AS '$libdir/postgis-1.4', 'BOX2D_right'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_box2d_same(box2d, box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box2d_same(box2d, box2d) RETURNS boolean
    AS '$libdir/postgis-1.4', 'BOX2D_same'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_box3d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box3d(geometry) RETURNS box3d
    AS '$libdir/postgis-1.4', 'LWGEOM_to_BOX3D'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_box3d(box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box3d(box2d) RETURNS box3d
    AS '$libdir/postgis-1.4', 'BOX2DFLOAT4_to_BOX3D'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_box3d_extent(box3d_extent); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_box3d_extent(box3d_extent) RETURNS box3d
    AS '$libdir/postgis-1.4', 'BOX3D_extent_to_BOX3D'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_buffer(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_buffer(geometry, double precision) RETURNS geometry
    AS '$libdir/postgis-1.4', 'buffer'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_buffer(geometry, double precision, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_buffer(geometry, double precision, integer) RETURNS geometry
    AS '$libdir/postgis-1.4', 'buffer'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_build_histogram2d(histogram2d, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_build_histogram2d(histogram2d, text, text) RETURNS histogram2d
    AS '$libdir/liblwgeom', 'build_lwhistogram2d'
    LANGUAGE c STABLE STRICT;


--
-- Name: st_build_histogram2d(histogram2d, text, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_build_histogram2d(histogram2d, text, text, text) RETURNS histogram2d
    AS $_$
BEGIN
	EXECUTE 'SET local search_path = '||$2||',public';
	RETURN public.build_histogram2d($1,$3,$4);
END
$_$
    LANGUAGE plpgsql STABLE STRICT;


--
-- Name: st_buildarea(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_buildarea(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_buildarea'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_bytea(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_bytea(geometry) RETURNS bytea
    AS '$libdir/postgis-1.4', 'LWGEOM_to_bytea'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_cache_bbox(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_cache_bbox() RETURNS trigger
    AS '$libdir/postgis-1.4', 'cache_bbox'
    LANGUAGE c;


--
-- Name: st_centroid(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_centroid(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'centroid'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_collect(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_collect(geometry, geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_collect'
    LANGUAGE c IMMUTABLE;


--
-- Name: st_collect(geometry[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_collect(geometry[]) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_collect_garray'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_collect_garray(geometry[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_collect_garray(geometry[]) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_collect_garray'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_collector(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_collector(geometry, geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_collect'
    LANGUAGE c IMMUTABLE;


--
-- Name: st_combine_bbox(box2d, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_combine_bbox(box2d, geometry) RETURNS box2d
    AS '$libdir/postgis-1.4', 'BOX2DFLOAT4_combine'
    LANGUAGE c IMMUTABLE;


--
-- Name: st_combine_bbox(box3d, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_combine_bbox(box3d, geometry) RETURNS box3d
    AS '$libdir/postgis-1.4', 'BOX3D_combine'
    LANGUAGE c IMMUTABLE;


--
-- Name: st_combine_bbox(box3d_extent, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_combine_bbox(box3d_extent, geometry) RETURNS box3d_extent
    AS '$libdir/postgis-1.4', 'BOX3D_combine'
    LANGUAGE c IMMUTABLE;


--
-- Name: st_compression(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_compression(chip) RETURNS integer
    AS '$libdir/postgis-1.4', 'CHIP_getCompression'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_contains(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_contains(geometry, geometry) RETURNS boolean
    AS $_$SELECT $1 && $2 AND _ST_Contains($1,$2)$_$
    LANGUAGE sql IMMUTABLE;


--
-- Name: st_containsproperly(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_containsproperly(geometry, geometry) RETURNS boolean
    AS $_$SELECT $1 && $2 AND _ST_ContainsProperly($1,$2)$_$
    LANGUAGE sql IMMUTABLE;


--
-- Name: st_convexhull(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_convexhull(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'convexhull'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_coorddim(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_coorddim(geometry) RETURNS smallint
    AS '$libdir/postgis-1.4', 'LWGEOM_ndims'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_coveredby(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_coveredby(geometry, geometry) RETURNS boolean
    AS $_$SELECT $1 && $2 AND _ST_CoveredBy($1,$2)$_$
    LANGUAGE sql IMMUTABLE;


--
-- Name: st_covers(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_covers(geometry, geometry) RETURNS boolean
    AS $_$SELECT $1 && $2 AND _ST_Covers($1,$2)$_$
    LANGUAGE sql IMMUTABLE;


--
-- Name: st_create_histogram2d(box2d, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_create_histogram2d(box2d, integer) RETURNS histogram2d
    AS '$libdir/liblwgeom', 'create_lwhistogram2d'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_crosses(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_crosses(geometry, geometry) RETURNS boolean
    AS $_$SELECT $1 && $2 AND _ST_Crosses($1,$2)$_$
    LANGUAGE sql IMMUTABLE;


--
-- Name: st_curvetoline(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_curvetoline(geometry, integer) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_curve_segmentize'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_curvetoline(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_curvetoline(geometry) RETURNS geometry
    AS $_$SELECT ST_CurveToLine($1, 32)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_datatype(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_datatype(chip) RETURNS integer
    AS '$libdir/postgis-1.4', 'CHIP_getDatatype'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_difference(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_difference(geometry, geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'difference'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_dimension(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_dimension(geometry) RETURNS integer
    AS '$libdir/postgis-1.4', 'LWGEOM_dimension'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_disjoint(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_disjoint(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'disjoint'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_distance(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_distance(geometry, geometry) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_mindistance2d'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_distance_sphere(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_distance_sphere(geometry, geometry) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_distance_sphere'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_distance_spheroid(geometry, geometry, spheroid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_distance_spheroid(geometry, geometry, spheroid) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_distance_ellipsoid_point'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_dropbbox(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_dropbbox(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_dropBBOX'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_dump(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_dump(geometry) RETURNS SETOF geometry_dump
    AS '$libdir/postgis-1.4', 'LWGEOM_dump'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_dumprings(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_dumprings(geometry) RETURNS SETOF geometry_dump
    AS '$libdir/postgis-1.4', 'LWGEOM_dump_rings'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_dwithin(geometry, geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_dwithin(geometry, geometry, double precision) RETURNS boolean
    AS $_$SELECT $1 && ST_Expand($2,$3) AND $2 && ST_Expand($1,$3) AND _ST_DWithin($1, $2, $3)$_$
    LANGUAGE sql IMMUTABLE;


--
-- Name: st_endpoint(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_endpoint(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_endpoint_linestring'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_envelope(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_envelope(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_envelope'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_equals(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_equals(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'geomequals'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_estimate_histogram2d(histogram2d, box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_estimate_histogram2d(histogram2d, box2d) RETURNS double precision
    AS '$libdir/liblwgeom', 'estimate_lwhistogram2d'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_estimated_extent(text, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_estimated_extent(text, text, text) RETURNS box2d
    AS '$libdir/postgis-1.4', 'LWGEOM_estimated_extent'
    LANGUAGE c IMMUTABLE STRICT SECURITY DEFINER;


--
-- Name: st_estimated_extent(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_estimated_extent(text, text) RETURNS box2d
    AS '$libdir/postgis-1.4', 'LWGEOM_estimated_extent'
    LANGUAGE c IMMUTABLE STRICT SECURITY DEFINER;


--
-- Name: st_expand(box3d, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_expand(box3d, double precision) RETURNS box3d
    AS '$libdir/postgis-1.4', 'BOX3D_expand'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_expand(box2d, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_expand(box2d, double precision) RETURNS box2d
    AS '$libdir/postgis-1.4', 'BOX2DFLOAT4_expand'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_expand(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_expand(geometry, double precision) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_expand'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_explode_histogram2d(histogram2d, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_explode_histogram2d(histogram2d, text) RETURNS histogram2d
    AS '$libdir/liblwgeom', 'explode_lwhistogram2d'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_exteriorring(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_exteriorring(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_exteriorring_polygon'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_factor(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_factor(chip) RETURNS real
    AS '$libdir/postgis-1.4', 'CHIP_getFactor'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_find_extent(text, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_find_extent(text, text, text) RETURNS box2d
    AS $_$
DECLARE
	schemaname alias for $1;
	tablename alias for $2;
	columnname alias for $3;
	myrec RECORD;

BEGIN
	FOR myrec IN EXECUTE 'SELECT extent("' || columnname || '") FROM "' || schemaname || '"."' || tablename || '"' LOOP
		return myrec.extent;
	END LOOP; 
END;
$_$
    LANGUAGE plpgsql IMMUTABLE STRICT;


--
-- Name: st_find_extent(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_find_extent(text, text) RETURNS box2d
    AS $_$
DECLARE
	tablename alias for $1;
	columnname alias for $2;
	myrec RECORD;

BEGIN
	FOR myrec IN EXECUTE 'SELECT extent("' || columnname || '") FROM "' || tablename || '"' LOOP
		return myrec.extent;
	END LOOP; 
END;
$_$
    LANGUAGE plpgsql IMMUTABLE STRICT;


--
-- Name: st_force_2d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_force_2d(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_force_2d'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_force_3d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_force_3d(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_force_3dz'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_force_3dm(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_force_3dm(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_force_3dm'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_force_3dz(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_force_3dz(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_force_3dz'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_force_4d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_force_4d(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_force_4d'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_force_collection(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_force_collection(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_force_collection'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_forcerhr(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_forcerhr(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_forceRHR_poly'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_geohash(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geohash(geometry, integer) RETURNS text
    AS '$libdir/postgis-1.4', 'ST_GeoHash'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_geohash(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geohash(geometry) RETURNS text
    AS $_$SELECT ST_GeoHash($1, 0)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_geom_accum(geometry[], geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geom_accum(geometry[], geometry) RETURNS geometry[]
    AS '$libdir/postgis-1.4', 'LWGEOM_accum'
    LANGUAGE c IMMUTABLE;


--
-- Name: st_geomcollfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geomcollfromtext(text, integer) RETURNS geometry
    AS $_$
	SELECT CASE
	WHEN geometrytype(ST_GeomFromText($1, $2)) = 'GEOMETRYCOLLECTION'
	THEN ST_GeomFromText($1,$2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_geomcollfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geomcollfromtext(text) RETURNS geometry
    AS $_$
	SELECT CASE
	WHEN geometrytype(ST_GeomFromText($1)) = 'GEOMETRYCOLLECTION'
	THEN ST_GeomFromText($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_geomcollfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geomcollfromwkb(bytea, integer) RETURNS geometry
    AS $_$
	SELECT CASE
	WHEN geometrytype(GeomFromWKB($1, $2)) = 'GEOMETRYCOLLECTION'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_geomcollfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geomcollfromwkb(bytea) RETURNS geometry
    AS $_$
	SELECT CASE
	WHEN geometrytype(ST_GeomFromWKB($1)) = 'GEOMETRYCOLLECTION'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_geometry(box2d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry(box2d) RETURNS geometry
    AS '$libdir/postgis-1.4', 'BOX2DFLOAT4_to_LWGEOM'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_geometry(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry(box3d) RETURNS geometry
    AS '$libdir/postgis-1.4', 'BOX3D_to_LWGEOM'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_geometry(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry(text) RETURNS geometry
    AS '$libdir/postgis-1.4', 'parse_WKT_lwgeom'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_geometry(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry(chip) RETURNS geometry
    AS '$libdir/postgis-1.4', 'CHIP_to_LWGEOM'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_geometry(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry(bytea) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_from_bytea'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_geometry(box3d_extent); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry(box3d_extent) RETURNS geometry
    AS '$libdir/postgis-1.4', 'BOX3D_to_LWGEOM'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_geometry_above(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_above(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'LWGEOM_above'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_geometry_below(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_below(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'LWGEOM_below'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_geometry_cmp(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_cmp(geometry, geometry) RETURNS integer
    AS '$libdir/postgis-1.4', 'lwgeom_cmp'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_geometry_contain(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_contain(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'LWGEOM_contain'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_geometry_contained(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_contained(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'LWGEOM_contained'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_geometry_eq(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_eq(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'lwgeom_eq'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_geometry_ge(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_ge(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'lwgeom_ge'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_geometry_gt(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_gt(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'lwgeom_gt'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_geometry_le(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_le(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'lwgeom_le'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_geometry_left(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_left(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'LWGEOM_left'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_geometry_lt(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_lt(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'lwgeom_lt'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_geometry_overabove(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_overabove(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'LWGEOM_overabove'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_geometry_overbelow(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_overbelow(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'LWGEOM_overbelow'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_geometry_overlap(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_overlap(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'LWGEOM_overlap'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_geometry_overleft(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_overleft(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'LWGEOM_overleft'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_geometry_overright(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_overright(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'LWGEOM_overright'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_geometry_right(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_right(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'LWGEOM_right'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_geometry_same(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometry_same(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'LWGEOM_same'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_geometryfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometryfromtext(text) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_from_text'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_geometryfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometryfromtext(text, integer) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_from_text'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_geometryn(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometryn(geometry, integer) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_geometryn_collection'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_geometrytype(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geometrytype(geometry) RETURNS text
    AS $_$ 
	DECLARE
	gtype text := geometrytype($1);
	BEGIN
	IF (gtype IN ('POINT', 'POINTM')) THEN
	    gtype := 'Point';
	ELSIF (gtype IN ('LINESTRING', 'LINESTRINGM')) THEN
	    gtype := 'LineString';
	ELSIF (gtype IN ('POLYGON', 'POLYGONM')) THEN
	    gtype := 'Polygon';
	ELSIF (gtype IN ('MULTIPOINT', 'MULTIPOINTM')) THEN
	    gtype := 'MultiPoint';
	ELSIF (gtype IN ('MULTILINESTRING', 'MULTILINESTRINGM')) THEN
	    gtype := 'MultiLineString';
	ELSIF (gtype IN ('MULTIPOLYGON', 'MULTIPOLYGONM')) THEN
	    gtype := 'MultiPolygon';
	ELSE
	    gtype := 'Geometry';
	END IF;
	RETURN 'ST_' || gtype;
	END
$_$
    LANGUAGE plpgsql IMMUTABLE STRICT;


--
-- Name: st_geomfromewkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geomfromewkb(bytea) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOMFromWKB'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_geomfromewkt(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geomfromewkt(text) RETURNS geometry
    AS '$libdir/postgis-1.4', 'parse_WKT_lwgeom'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_geomfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geomfromtext(text) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_from_text'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_geomfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geomfromtext(text, integer) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_from_text'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_geomfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geomfromwkb(bytea) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_from_WKB'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_geomfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_geomfromwkb(bytea, integer) RETURNS geometry
    AS $_$SELECT ST_SetSRID(ST_GeomFromWKB($1), $2)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_hasarc(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_hasarc(geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'LWGEOM_has_arc'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_hasbbox(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_hasbbox(geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'LWGEOM_hasBBOX'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_height(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_height(chip) RETURNS integer
    AS '$libdir/postgis-1.4', 'CHIP_getHeight'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_interiorringn(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_interiorringn(geometry, integer) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_interiorringn_polygon'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_intersection(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_intersection(geometry, geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'intersection'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_intersects(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_intersects(geometry, geometry) RETURNS boolean
    AS $_$SELECT $1 && $2 AND _ST_Intersects($1,$2)$_$
    LANGUAGE sql IMMUTABLE;


--
-- Name: st_isclosed(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_isclosed(geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'LWGEOM_isclosed_linestring'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_isempty(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_isempty(geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'LWGEOM_isempty'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_isring(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_isring(geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'isring'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_issimple(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_issimple(geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'issimple'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_isvalid(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_isvalid(geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'isvalid'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_isvalidreason(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_isvalidreason(geometry) RETURNS text
    AS '$libdir/postgis-1.4', 'isvalidreason'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_length(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_length(geometry) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_length2d_linestring'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_length2d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_length2d(geometry) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_length2d_linestring'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_length2d_spheroid(geometry, spheroid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_length2d_spheroid(geometry, spheroid) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_length2d_ellipsoid_linestring'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_length3d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_length3d(geometry) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_length_linestring'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_length3d_spheroid(geometry, spheroid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_length3d_spheroid(geometry, spheroid) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_length_ellipsoid_linestring'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_length_spheroid(geometry, spheroid); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_length_spheroid(geometry, spheroid) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_length_ellipsoid_linestring'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_line_interpolate_point(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_line_interpolate_point(geometry, double precision) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_line_interpolate_point'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_line_locate_point(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_line_locate_point(geometry, geometry) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_line_locate_point'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_line_substring(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_line_substring(geometry, double precision, double precision) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_line_substring'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_linecrossingdirection(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_linecrossingdirection(geometry, geometry) RETURNS integer
    AS $_$ SELECT CASE WHEN NOT $1 && $2 THEN 0 ELSE _ST_LineCrossingDirection($1,$2) END $_$
    LANGUAGE sql IMMUTABLE;


--
-- Name: st_linefrommultipoint(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_linefrommultipoint(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_line_from_mpoint'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_linefromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_linefromtext(text) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromText($1)) = 'LINESTRING'
	THEN ST_GeomFromText($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_linefromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_linefromtext(text, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1, $2)) = 'LINESTRING'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_linefromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_linefromwkb(bytea, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1, $2)) = 'LINESTRING'
	THEN ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_linefromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_linefromwkb(bytea) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'LINESTRING'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_linemerge(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_linemerge(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'linemerge'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_linestringfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_linestringfromwkb(bytea, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1, $2)) = 'LINESTRING'
	THEN ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_linestringfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_linestringfromwkb(bytea) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'LINESTRING'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_linetocurve(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_linetocurve(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_line_desegmentize'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_locate_along_measure(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_locate_along_measure(geometry, double precision) RETURNS geometry
    AS $_$ SELECT locate_between_measures($1, $2, $2) $_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_locate_between_measures(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_locate_between_measures(geometry, double precision, double precision) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_locate_between_m'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_locatebetweenelevations(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_locatebetweenelevations(geometry, double precision, double precision) RETURNS geometry
    AS '$libdir/postgis-1.4', 'ST_LocateBetweenElevations'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_m(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_m(geometry) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_m_point'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_makebox2d(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_makebox2d(geometry, geometry) RETURNS box2d
    AS '$libdir/postgis-1.4', 'BOX2DFLOAT4_construct'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_makebox3d(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_makebox3d(geometry, geometry) RETURNS box3d
    AS '$libdir/postgis-1.4', 'BOX3D_construct'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_makeline(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_makeline(geometry, geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_makeline'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_makeline(geometry[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_makeline(geometry[]) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_makeline_garray'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_makeline_garray(geometry[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_makeline_garray(geometry[]) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_makeline_garray'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_makepoint(double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_makepoint(double precision, double precision) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_makepoint'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_makepoint(double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_makepoint(double precision, double precision, double precision) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_makepoint'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_makepoint(double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_makepoint(double precision, double precision, double precision, double precision) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_makepoint'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_makepointm(double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_makepointm(double precision, double precision, double precision) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_makepoint3dm'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_makepolygon(geometry, geometry[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_makepolygon(geometry, geometry[]) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_makepoly'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_makepolygon(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_makepolygon(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_makepoly'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_max_distance(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_max_distance(geometry, geometry) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_maxdistance2d_linestring'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_mem_size(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mem_size(geometry) RETURNS integer
    AS '$libdir/postgis-1.4', 'LWGEOM_mem_size'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_minimumboundingcircle(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_minimumboundingcircle(inputgeom geometry, segs_per_quarter integer) RETURNS geometry
    AS $$
	DECLARE     
	hull GEOMETRY;
	ring GEOMETRY;
	center GEOMETRY;
	radius DOUBLE PRECISION;
	dist DOUBLE PRECISION;
	d DOUBLE PRECISION;
	idx1 integer;
	idx2 integer;
	l1 GEOMETRY;
	l2 GEOMETRY;
	p1 GEOMETRY;
	p2 GEOMETRY;
	a1 DOUBLE PRECISION;
	a2 DOUBLE PRECISION;

	
	BEGIN

	-- First compute the ConvexHull of the geometry
	hull = ST_ConvexHull(inputgeom);
	--A point really has no MBC
	IF ST_GeometryType(hull) = 'ST_Point' THEN
		RETURN hull;
	END IF;
	-- convert the hull perimeter to a linestring so we can manipulate individual points
	--If its already a linestring force it to a closed linestring
	ring = CASE WHEN ST_GeometryType(hull) = 'ST_LineString' THEN ST_AddPoint(hull, ST_StartPoint(hull)) ELSE ST_ExteriorRing(hull) END;

	dist = 0;
	-- Brute Force - check every pair
	FOR i in 1 .. (ST_NumPoints(ring)-2)
		LOOP
			FOR j in i .. (ST_NumPoints(ring)-1)
				LOOP
				d = ST_Distance(ST_PointN(ring,i),ST_PointN(ring,j));
				-- Check the distance and update if larger
				IF (d > dist) THEN
					dist = d;
					idx1 = i;
					idx2 = j;
				END IF;
			END LOOP;
		END LOOP;

	-- We now have the diameter of the convex hull.  The following line returns it if desired.
	-- RETURN MakeLine(PointN(ring,idx1),PointN(ring,idx2));

	-- Now for the Minimum Bounding Circle.  Since we know the two points furthest from each
	-- other, the MBC must go through those two points. Start with those points as a diameter of a circle.
	
	-- The radius is half the distance between them and the center is midway between them
	radius = ST_Distance(ST_PointN(ring,idx1),ST_PointN(ring,idx2)) / 2.0;
	center = ST_Line_interpolate_point(ST_MakeLine(ST_PointN(ring,idx1),ST_PointN(ring,idx2)),0.5);

	-- Loop through each vertex and check if the distance from the center to the point
	-- is greater than the current radius.
	FOR k in 1 .. (ST_NumPoints(ring)-1)
		LOOP
		IF(k <> idx1 and k <> idx2) THEN
			dist = ST_Distance(center,ST_PointN(ring,k));
			IF (dist > radius) THEN
				-- We have to expand the circle.  The new circle must pass trhough
				-- three points - the two original diameters and this point.
				
				-- Draw a line from the first diameter to this point
				l1 = ST_Makeline(ST_PointN(ring,idx1),ST_PointN(ring,k));
				-- Compute the midpoint
				p1 = ST_line_interpolate_point(l1,0.5);
				-- Rotate the line 90 degrees around the midpoint (perpendicular bisector)
				l1 = ST_Translate(ST_Rotate(ST_Translate(l1,-X(p1),-Y(p1)),pi()/2),X(p1),Y(p1));
				--  Compute the azimuth of the bisector
				a1 = ST_Azimuth(ST_PointN(l1,1),ST_PointN(l1,2));
				--  Extend the line in each direction the new computed distance to insure they will intersect
				l1 = ST_AddPoint(l1,ST_Makepoint(X(ST_PointN(l1,2))+sin(a1)*dist,Y(ST_PointN(l1,2))+cos(a1)*dist),-1);
				l1 = ST_AddPoint(l1,ST_Makepoint(X(ST_PointN(l1,1))-sin(a1)*dist,Y(ST_PointN(l1,1))-cos(a1)*dist),0);

				-- Repeat for the line from the point to the other diameter point
				l2 = ST_Makeline(ST_PointN(ring,idx2),ST_PointN(ring,k));
				p2 = ST_Line_interpolate_point(l2,0.5);
				l2 = ST_Translate(ST_Rotate(ST_Translate(l2,-X(p2),-Y(p2)),pi()/2),X(p2),Y(p2));
				a2 = ST_Azimuth(ST_PointN(l2,1),ST_PointN(l2,2));
				l2 = ST_AddPoint(l2,ST_Makepoint(X(ST_PointN(l2,2))+sin(a2)*dist,Y(ST_PointN(l2,2))+cos(a2)*dist),-1);
				l2 = ST_AddPoint(l2,ST_Makepoint(X(ST_PointN(l2,1))-sin(a2)*dist,Y(ST_PointN(l2,1))-cos(a2)*dist),0);

				-- The new center is the intersection of the two bisectors
				center = ST_Intersection(l1,l2);
				-- The new radius is the distance to any of the three points
				radius = ST_Distance(center,ST_PointN(ring,idx1));
			END IF;
		END IF;
		END LOOP;
	--DONE!!  Return the MBC via the buffer command
	RETURN ST_Buffer(center,radius,segs_per_quarter);

	END;
$$
    LANGUAGE plpgsql IMMUTABLE STRICT;


--
-- Name: st_minimumboundingcircle(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_minimumboundingcircle(geometry) RETURNS geometry
    AS $_$SELECT ST_MinimumBoundingCircle($1, 48)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_mlinefromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mlinefromtext(text, integer) RETURNS geometry
    AS $_$
	SELECT CASE
	WHEN geometrytype(GeomFromText($1, $2)) = 'MULTILINESTRING'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_mlinefromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mlinefromtext(text) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromText($1)) = 'MULTILINESTRING'
	THEN ST_GeomFromText($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_mlinefromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mlinefromwkb(bytea, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1, $2)) = 'MULTILINESTRING'
	THEN ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_mlinefromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mlinefromwkb(bytea) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'MULTILINESTRING'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_mpointfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mpointfromtext(text, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1, $2)) = 'MULTIPOINT'
	THEN GeomFromText($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_mpointfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mpointfromtext(text) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromText($1)) = 'MULTIPOINT'
	THEN ST_GeomFromText($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_mpointfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mpointfromwkb(bytea, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'MULTIPOINT'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_mpointfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mpointfromwkb(bytea) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'MULTIPOINT'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_mpolyfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mpolyfromtext(text, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromText($1, $2)) = 'MULTIPOLYGON'
	THEN ST_GeomFromText($1,$2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_mpolyfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mpolyfromtext(text) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromText($1)) = 'MULTIPOLYGON'
	THEN ST_GeomFromText($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_mpolyfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mpolyfromwkb(bytea, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1, $2)) = 'MULTIPOLYGON'
	THEN ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_mpolyfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_mpolyfromwkb(bytea) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'MULTIPOLYGON'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_multi(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_multi(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_force_multi'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_multilinefromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_multilinefromwkb(bytea) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'MULTILINESTRING'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_multilinestringfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_multilinestringfromtext(text) RETURNS geometry
    AS $_$SELECT ST_MLineFromText($1)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_multilinestringfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_multilinestringfromtext(text, integer) RETURNS geometry
    AS $_$SELECT MLineFromText($1, $2)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_multipointfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_multipointfromtext(text) RETURNS geometry
    AS $_$SELECT MPointFromText($1)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_multipointfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_multipointfromwkb(bytea, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1,$2)) = 'MULTIPOINT'
	THEN ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_multipointfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_multipointfromwkb(bytea) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'MULTIPOINT'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_multipolyfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_multipolyfromwkb(bytea, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1, $2)) = 'MULTIPOLYGON'
	THEN ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_multipolyfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_multipolyfromwkb(bytea) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'MULTIPOLYGON'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_multipolygonfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_multipolygonfromtext(text, integer) RETURNS geometry
    AS $_$SELECT MPolyFromText($1, $2)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_multipolygonfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_multipolygonfromtext(text) RETURNS geometry
    AS $_$SELECT MPolyFromText($1)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_ndims(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_ndims(geometry) RETURNS smallint
    AS '$libdir/postgis-1.4', 'LWGEOM_ndims'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_noop(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_noop(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_noop'
    LANGUAGE c STRICT;


--
-- Name: st_npoints(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_npoints(geometry) RETURNS integer
    AS '$libdir/postgis-1.4', 'LWGEOM_npoints'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_nrings(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_nrings(geometry) RETURNS integer
    AS '$libdir/postgis-1.4', 'LWGEOM_nrings'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_numgeometries(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_numgeometries(geometry) RETURNS integer
    AS '$libdir/postgis-1.4', 'LWGEOM_numgeometries_collection'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_numinteriorring(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_numinteriorring(geometry) RETURNS integer
    AS '$libdir/postgis-1.4', 'LWGEOM_numinteriorrings_polygon'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_numinteriorrings(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_numinteriorrings(geometry) RETURNS integer
    AS '$libdir/postgis-1.4', 'LWGEOM_numinteriorrings_polygon'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_numpoints(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_numpoints(geometry) RETURNS integer
    AS '$libdir/postgis-1.4', 'LWGEOM_numpoints_linestring'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_orderingequals(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_orderingequals(geometry, geometry) RETURNS boolean
    AS $_$ 
	SELECT $1 && $2 AND $1 ~= $2
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_overlaps(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_overlaps(geometry, geometry) RETURNS boolean
    AS $_$SELECT $1 && $2 AND _ST_Overlaps($1,$2)$_$
    LANGUAGE sql IMMUTABLE;


--
-- Name: st_perimeter(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_perimeter(geometry) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_perimeter2d_poly'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_perimeter2d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_perimeter2d(geometry) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_perimeter2d_poly'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_perimeter3d(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_perimeter3d(geometry) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_perimeter_poly'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_point(double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_point(double precision, double precision) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_makepoint'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_point_inside_circle(geometry, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_point_inside_circle(geometry, double precision, double precision, double precision) RETURNS boolean
    AS '$libdir/postgis-1.4', 'LWGEOM_inside_circle_point'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_pointfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_pointfromtext(text) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromText($1)) = 'POINT'
	THEN ST_GeomFromText($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_pointfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_pointfromtext(text, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromText($1, $2)) = 'POINT'
	THEN ST_GeomFromText($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_pointfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_pointfromwkb(bytea, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1, $2)) = 'POINT'
	THEN ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_pointfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_pointfromwkb(bytea) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'POINT'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_pointn(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_pointn(geometry, integer) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_pointn_linestring'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_pointonsurface(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_pointonsurface(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'pointonsurface'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_polyfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_polyfromtext(text) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromText($1)) = 'POLYGON'
	THEN ST_GeomFromText($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_polyfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_polyfromtext(text, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromText($1, $2)) = 'POLYGON'
	THEN ST_GeomFromText($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_polyfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_polyfromwkb(bytea, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1, $2)) = 'POLYGON'
	THEN ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_polyfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_polyfromwkb(bytea) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1)) = 'POLYGON'
	THEN ST_GeomFromWKB($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_polygon(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_polygon(geometry, integer) RETURNS geometry
    AS $_$ 
	SELECT setSRID(makepolygon($1), $2)
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_polygonfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_polygonfromtext(text, integer) RETURNS geometry
    AS $_$SELECT PolyFromText($1, $2)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_polygonfromtext(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_polygonfromtext(text) RETURNS geometry
    AS $_$SELECT ST_PolyFromText($1)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_polygonfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_polygonfromwkb(bytea, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(ST_GeomFromWKB($1,$2)) = 'POLYGON'
	THEN ST_GeomFromWKB($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_polygonfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_polygonfromwkb(bytea) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'POLYGON'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_polygonize(geometry[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_polygonize(geometry[]) RETURNS geometry
    AS '$libdir/postgis-1.4', 'polygonize_garray'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_polygonize_garray(geometry[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_polygonize_garray(geometry[]) RETURNS geometry
    AS '$libdir/postgis-1.4', 'polygonize_garray'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_postgis_gist_joinsel(internal, oid, internal, smallint); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_postgis_gist_joinsel(internal, oid, internal, smallint) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_gist_joinsel'
    LANGUAGE c;


--
-- Name: st_postgis_gist_sel(internal, oid, internal, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_postgis_gist_sel(internal, oid, internal, integer) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_gist_sel'
    LANGUAGE c;


--
-- Name: st_relate(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_relate(geometry, geometry) RETURNS text
    AS '$libdir/postgis-1.4', 'relate_full'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_relate(geometry, geometry, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_relate(geometry, geometry, text) RETURNS boolean
    AS '$libdir/postgis-1.4', 'relate_pattern'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_removepoint(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_removepoint(geometry, integer) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_removepoint'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_reverse(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_reverse(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_reverse'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_rotate(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_rotate(geometry, double precision) RETURNS geometry
    AS $_$SELECT rotateZ($1, $2)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_rotatex(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_rotatex(geometry, double precision) RETURNS geometry
    AS $_$SELECT affine($1, 1, 0, 0, 0, cos($2), -sin($2), 0, sin($2), cos($2), 0, 0, 0)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_rotatey(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_rotatey(geometry, double precision) RETURNS geometry
    AS $_$SELECT affine($1,  cos($2), 0, sin($2),  0, 1, 0,  -sin($2), 0, cos($2), 0,  0, 0)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_rotatez(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_rotatez(geometry, double precision) RETURNS geometry
    AS $_$SELECT affine($1,  cos($2), -sin($2), 0,  sin($2), cos($2), 0,  0, 0, 1,  0, 0, 0)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_scale(geometry, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_scale(geometry, double precision, double precision, double precision) RETURNS geometry
    AS $_$SELECT affine($1,  $2, 0, 0,  0, $3, 0,  0, 0, $4,  0, 0, 0)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_scale(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_scale(geometry, double precision, double precision) RETURNS geometry
    AS $_$SELECT scale($1, $2, $3, 1)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_segmentize(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_segmentize(geometry, double precision) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_segmentize2d'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_setfactor(chip, real); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_setfactor(chip, real) RETURNS chip
    AS '$libdir/postgis-1.4', 'CHIP_setFactor'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_setpoint(geometry, integer, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_setpoint(geometry, integer, geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_setpoint_linestring'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_setsrid(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_setsrid(geometry, integer) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_setSRID'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_shift_longitude(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_shift_longitude(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_longitude_shift'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_simplify(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_simplify(geometry, double precision) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_simplify2d'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_simplifypreservetopology(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_simplifypreservetopology(geometry, double precision) RETURNS geometry
    AS '$libdir/postgis-1.4', 'topologypreservesimplify'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_snaptogrid(geometry, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_snaptogrid(geometry, double precision, double precision, double precision, double precision) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_snaptogrid'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_snaptogrid(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_snaptogrid(geometry, double precision, double precision) RETURNS geometry
    AS $_$SELECT ST_SnapToGrid($1, 0, 0, $2, $3)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_snaptogrid(geometry, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_snaptogrid(geometry, double precision) RETURNS geometry
    AS $_$SELECT ST_SnapToGrid($1, 0, 0, $2, $2)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_snaptogrid(geometry, geometry, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_snaptogrid(geometry, geometry, double precision, double precision, double precision, double precision) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_snaptogrid_pointoff'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_srid(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_srid(chip) RETURNS integer
    AS '$libdir/postgis-1.4', 'CHIP_getSRID'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_srid(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_srid(geometry) RETURNS integer
    AS '$libdir/postgis-1.4', 'LWGEOM_getSRID'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_startpoint(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_startpoint(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_startpoint_linestring'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_summary(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_summary(geometry) RETURNS text
    AS '$libdir/postgis-1.4', 'LWGEOM_summary'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_symdifference(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_symdifference(geometry, geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'symdifference'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_symmetricdifference(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_symmetricdifference(geometry, geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'symdifference'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_text(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_text(geometry) RETURNS text
    AS '$libdir/postgis-1.4', 'LWGEOM_to_text'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_text(boolean); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_text(boolean) RETURNS text
    AS '$libdir/liblwgeom', 'BOOL_to_text'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_touches(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_touches(geometry, geometry) RETURNS boolean
    AS $_$SELECT $1 && $2 AND _ST_Touches($1,$2)$_$
    LANGUAGE sql IMMUTABLE;


--
-- Name: st_transform(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_transform(geometry, integer) RETURNS geometry
    AS '$libdir/postgis-1.4', 'transform'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_translate(geometry, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_translate(geometry, double precision, double precision, double precision) RETURNS geometry
    AS $_$SELECT affine($1, 1, 0, 0, 0, 1, 0, 0, 0, 1, $2, $3, $4)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_translate(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_translate(geometry, double precision, double precision) RETURNS geometry
    AS $_$SELECT translate($1, $2, $3, 0)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_transscale(geometry, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_transscale(geometry, double precision, double precision, double precision, double precision) RETURNS geometry
    AS $_$SELECT affine($1,  $4, 0, 0,  0, $5, 0, 
		0, 0, 1,  $2 * $4, $3 * $5, 0)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: st_union(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_union(geometry, geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'geomunion'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_union(geometry[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_union(geometry[]) RETURNS geometry
    AS '$libdir/postgis-1.4', 'pgis_union_geometry_array'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_unite_garray(geometry[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_unite_garray(geometry[]) RETURNS geometry
    AS '$libdir/postgis-1.4', 'pgis_union_geometry_array'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_width(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_width(chip) RETURNS integer
    AS '$libdir/postgis-1.4', 'CHIP_getWidth'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_within(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_within(geometry, geometry) RETURNS boolean
    AS $_$SELECT $1 && $2 AND _ST_Within($1,$2)$_$
    LANGUAGE sql IMMUTABLE;


--
-- Name: st_wkbtosql(bytea); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_wkbtosql(bytea) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_from_WKB'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_wkttosql(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_wkttosql(text) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_from_text'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_x(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_x(geometry) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_x_point'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_xmax(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_xmax(box3d) RETURNS double precision
    AS '$libdir/postgis-1.4', 'BOX3D_xmax'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_xmin(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_xmin(box3d) RETURNS double precision
    AS '$libdir/postgis-1.4', 'BOX3D_xmin'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_y(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_y(geometry) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_y_point'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_ymax(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_ymax(box3d) RETURNS double precision
    AS '$libdir/postgis-1.4', 'BOX3D_ymax'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_ymin(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_ymin(box3d) RETURNS double precision
    AS '$libdir/postgis-1.4', 'BOX3D_ymin'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_z(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_z(geometry) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_z_point'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_zmax(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_zmax(box3d) RETURNS double precision
    AS '$libdir/postgis-1.4', 'BOX3D_zmax'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_zmflag(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_zmflag(geometry) RETURNS smallint
    AS '$libdir/postgis-1.4', 'LWGEOM_zmflag'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: st_zmin(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION st_zmin(box3d) RETURNS double precision
    AS '$libdir/postgis-1.4', 'BOX3D_zmin'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: startpoint(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION startpoint(geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'LWGEOM_startpoint_linestring'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: summary(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION summary(geometry) RETURNS text
    AS '$libdir/postgis-1.4', 'LWGEOM_summary'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: symdifference(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION symdifference(geometry, geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'symdifference'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: symmetricdifference(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION symmetricdifference(geometry, geometry) RETURNS geometry
    AS '$libdir/postgis-1.4', 'symdifference'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: text(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION text(geometry) RETURNS text
    AS '$libdir/postgis-1.4', 'LWGEOM_to_text'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: text(boolean); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION text(boolean) RETURNS text
    AS '$libdir/liblwgeom', 'BOOL_to_text'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: touches(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION touches(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'touches'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: transform(geometry, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION transform(geometry, integer) RETURNS geometry
    AS '$libdir/postgis-1.4', 'transform'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: transform_geometry(geometry, text, text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION transform_geometry(geometry, text, text, integer) RETURNS geometry
    AS '$libdir/postgis-1.4', 'transform_geom'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: translate(geometry, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION translate(geometry, double precision, double precision, double precision) RETURNS geometry
    AS $_$SELECT affine($1, 1, 0, 0, 0, 1, 0, 0, 0, 1, $2, $3, $4)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: translate(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION translate(geometry, double precision, double precision) RETURNS geometry
    AS $_$SELECT translate($1, $2, $3, 0)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: transscale(geometry, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION transscale(geometry, double precision, double precision, double precision, double precision) RETURNS geometry
    AS $_$SELECT affine($1,  $4, 0, 0,  0, $5, 0, 
		0, 0, 1,  $2 * $4, $3 * $5, 0)$_$
    LANGUAGE sql IMMUTABLE STRICT;


--
-- Name: unite_garray(geometry[]); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION unite_garray(geometry[]) RETURNS geometry
    AS '$libdir/postgis-1.4', 'pgis_union_geometry_array'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: unlockrows(text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION unlockrows(text) RETURNS integer
    AS $_$ 
DECLARE
	ret int;
BEGIN

	IF NOT LongTransactionsEnabled() THEN
		RAISE EXCEPTION 'Long transaction support disabled, use EnableLongTransaction() to enable.';
	END IF;

	EXECUTE 'DELETE FROM authorization_table where authid = ' ||
		quote_literal($1);

	GET DIAGNOSTICS ret = ROW_COUNT;

	RETURN ret;
END;
$_$
    LANGUAGE plpgsql STRICT;


--
-- Name: update_geometry_stats(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION update_geometry_stats() RETURNS text
    AS $$ SELECT 'update_geometry_stats() has been obsoleted. Statistics are automatically built running the ANALYZE command'::text$$
    LANGUAGE sql;


--
-- Name: update_geometry_stats(character varying, character varying); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION update_geometry_stats(character varying, character varying) RETURNS text
    AS $$SELECT update_geometry_stats();$$
    LANGUAGE sql;


--
-- Name: updategeometrysrid(character varying, character varying, character varying, character varying, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION updategeometrysrid(character varying, character varying, character varying, character varying, integer) RETURNS text
    AS $_$
DECLARE
	catalog_name alias for $1; 
	schema_name alias for $2;
	table_name alias for $3;
	column_name alias for $4;
	new_srid alias for $5;
	myrec RECORD;
	okay boolean;
	cname varchar;
	real_schema name;

BEGIN


	-- Find, check or fix schema_name
	IF ( schema_name != '' ) THEN
		okay = 'f';

		FOR myrec IN SELECT nspname FROM pg_namespace WHERE text(nspname) = schema_name LOOP
			okay := 't';
		END LOOP;

		IF ( okay <> 't' ) THEN
			RAISE EXCEPTION 'Invalid schema name';
		ELSE
			real_schema = schema_name;
		END IF;
	ELSE
		SELECT INTO real_schema current_schema()::text;
	END IF;

 	-- Find out if the column is in the geometry_columns table
	okay = 'f';
	FOR myrec IN SELECT * from geometry_columns where f_table_schema = text(real_schema) and f_table_name = table_name and f_geometry_column = column_name LOOP
		okay := 't';
	END LOOP; 
	IF (okay <> 't') THEN 
		RAISE EXCEPTION 'column not found in geometry_columns table';
		RETURN 'f';
	END IF;

	-- Update ref from geometry_columns table
	EXECUTE 'UPDATE geometry_columns SET SRID = ' || new_srid::text || 
		' where f_table_schema = ' ||
		quote_literal(real_schema) || ' and f_table_name = ' ||
		quote_literal(table_name)  || ' and f_geometry_column = ' ||
		quote_literal(column_name);
	
	-- Make up constraint name
	cname = 'enforce_srid_'  || column_name;

	-- Drop enforce_srid constraint
	EXECUTE 'ALTER TABLE ' || quote_ident(real_schema) ||
		'.' || quote_ident(table_name) ||
		' DROP constraint ' || quote_ident(cname);

	-- Update geometries SRID
	EXECUTE 'UPDATE ' || quote_ident(real_schema) ||
		'.' || quote_ident(table_name) ||
		' SET ' || quote_ident(column_name) ||
		' = setSRID(' || quote_ident(column_name) ||
		', ' || new_srid::text || ')';

	-- Reset enforce_srid constraint
	EXECUTE 'ALTER TABLE ' || quote_ident(real_schema) ||
		'.' || quote_ident(table_name) ||
		' ADD constraint ' || quote_ident(cname) ||
		' CHECK (srid(' || quote_ident(column_name) ||
		') = ' || new_srid::text || ')';

	RETURN real_schema || '.' || table_name || '.' || column_name ||' SRID changed to ' || new_srid::text;
	
END;
$_$
    LANGUAGE plpgsql STRICT;


--
-- Name: updategeometrysrid(character varying, character varying, character varying, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION updategeometrysrid(character varying, character varying, character varying, integer) RETURNS text
    AS $_$ 
DECLARE
	ret  text;
BEGIN
	SELECT UpdateGeometrySRID('',$1,$2,$3,$4) into ret;
	RETURN ret;
END;
$_$
    LANGUAGE plpgsql STRICT;


--
-- Name: updategeometrysrid(character varying, character varying, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION updategeometrysrid(character varying, character varying, integer) RETURNS text
    AS $_$ 
DECLARE
	ret  text;
BEGIN
	SELECT UpdateGeometrySRID('','',$1,$2,$3) into ret;
	RETURN ret;
END;
$_$
    LANGUAGE plpgsql STRICT;


--
-- Name: width(chip); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION width(chip) RETURNS integer
    AS '$libdir/postgis-1.4', 'CHIP_getWidth'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: within(geometry, geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION within(geometry, geometry) RETURNS boolean
    AS '$libdir/postgis-1.4', 'within'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: x(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION x(geometry) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_x_point'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: xmax(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION xmax(box3d) RETURNS double precision
    AS '$libdir/postgis-1.4', 'BOX3D_xmax'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: xmin(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION xmin(box3d) RETURNS double precision
    AS '$libdir/postgis-1.4', 'BOX3D_xmin'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: y(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION y(geometry) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_y_point'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: ymax(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ymax(box3d) RETURNS double precision
    AS '$libdir/postgis-1.4', 'BOX3D_ymax'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: ymin(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION ymin(box3d) RETURNS double precision
    AS '$libdir/postgis-1.4', 'BOX3D_ymin'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: z(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION z(geometry) RETURNS double precision
    AS '$libdir/postgis-1.4', 'LWGEOM_z_point'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: zmax(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION zmax(box3d) RETURNS double precision
    AS '$libdir/postgis-1.4', 'BOX3D_zmax'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: zmflag(geometry); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION zmflag(geometry) RETURNS smallint
    AS '$libdir/postgis-1.4', 'LWGEOM_zmflag'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: zmin(box3d); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION zmin(box3d) RETURNS double precision
    AS '$libdir/postgis-1.4', 'BOX3D_zmin'
    LANGUAGE c IMMUTABLE STRICT;


--
-- Name: accum(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE accum(geometry) (
    SFUNC = pgis_geometry_accum_transfn,
    STYPE = pgis_abs,
    FINALFUNC = pgis_geometry_accum_finalfn
);


--
-- Name: accum_old(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE accum_old(geometry) (
    SFUNC = st_geom_accum,
    STYPE = geometry[]
);


--
-- Name: collect(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE collect(geometry) (
    SFUNC = pgis_geometry_accum_transfn,
    STYPE = pgis_abs,
    FINALFUNC = pgis_geometry_collect_finalfn
);


--
-- Name: extent(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE extent(geometry) (
    SFUNC = public.st_combine_bbox,
    STYPE = box3d_extent
);


--
-- Name: extent3d(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE extent3d(geometry) (
    SFUNC = public.combine_bbox,
    STYPE = box3d
);


--
-- Name: geomunion(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE geomunion(geometry) (
    SFUNC = geom_accum,
    STYPE = geometry[],
    FINALFUNC = st_unite_garray
);


--
-- Name: makeline(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE makeline(geometry) (
    SFUNC = pgis_geometry_accum_transfn,
    STYPE = pgis_abs,
    FINALFUNC = pgis_geometry_makeline_finalfn
);


--
-- Name: memcollect(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE memcollect(geometry) (
    SFUNC = public.st_collect,
    STYPE = geometry
);


--
-- Name: memgeomunion(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE memgeomunion(geometry) (
    SFUNC = public.geomunion,
    STYPE = geometry
);


--
-- Name: polygonize(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE polygonize(geometry) (
    SFUNC = pgis_geometry_accum_transfn,
    STYPE = pgis_abs,
    FINALFUNC = pgis_geometry_polygonize_finalfn
);


--
-- Name: st_accum(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE st_accum(geometry) (
    SFUNC = pgis_geometry_accum_transfn,
    STYPE = pgis_abs,
    FINALFUNC = pgis_geometry_accum_finalfn
);


--
-- Name: st_accum_old(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE st_accum_old(geometry) (
    SFUNC = st_geom_accum,
    STYPE = geometry[]
);


--
-- Name: st_collect(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE st_collect(geometry) (
    SFUNC = pgis_geometry_accum_transfn,
    STYPE = pgis_abs,
    FINALFUNC = pgis_geometry_collect_finalfn
);


--
-- Name: st_extent(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE st_extent(geometry) (
    SFUNC = public.st_combine_bbox,
    STYPE = box3d_extent
);


--
-- Name: st_extent3d(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE st_extent3d(geometry) (
    SFUNC = public.st_combine_bbox,
    STYPE = box3d
);


--
-- Name: st_makeline(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE st_makeline(geometry) (
    SFUNC = pgis_geometry_accum_transfn,
    STYPE = pgis_abs,
    FINALFUNC = pgis_geometry_makeline_finalfn
);


--
-- Name: st_memcollect(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE st_memcollect(geometry) (
    SFUNC = public.st_collect,
    STYPE = geometry
);


--
-- Name: st_memunion(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE st_memunion(geometry) (
    SFUNC = public.st_union,
    STYPE = geometry
);


--
-- Name: st_polygonize(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE st_polygonize(geometry) (
    SFUNC = pgis_geometry_accum_transfn,
    STYPE = pgis_abs,
    FINALFUNC = pgis_geometry_polygonize_finalfn
);


--
-- Name: st_union(geometry); Type: AGGREGATE; Schema: public; Owner: -
--

CREATE AGGREGATE st_union(geometry) (
    SFUNC = pgis_geometry_accum_transfn,
    STYPE = pgis_abs,
    FINALFUNC = pgis_geometry_union_finalfn
);


--
-- Name: &&; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR && (
    PROCEDURE = st_geometry_overlap,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = &&,
    RESTRICT = st_postgis_gist_sel,
    JOIN = st_postgis_gist_joinsel
);


--
-- Name: &<; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR &< (
    PROCEDURE = st_geometry_overleft,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = &>,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


--
-- Name: &<|; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR &<| (
    PROCEDURE = st_geometry_overbelow,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = |&>,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


--
-- Name: &>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR &> (
    PROCEDURE = st_geometry_overright,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = &<,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


--
-- Name: <; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR < (
    PROCEDURE = st_geometry_lt,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- Name: <<; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR << (
    PROCEDURE = st_geometry_left,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = >>,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


--
-- Name: <<|; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <<| (
    PROCEDURE = st_geometry_below,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = |>>,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


--
-- Name: <=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR <= (
    PROCEDURE = st_geometry_le,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- Name: =; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR = (
    PROCEDURE = st_geometry_eq,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = =,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- Name: >; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR > (
    PROCEDURE = st_geometry_gt,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- Name: >=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR >= (
    PROCEDURE = st_geometry_ge,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- Name: >>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR >> (
    PROCEDURE = st_geometry_right,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = <<,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


--
-- Name: @; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR @ (
    PROCEDURE = st_geometry_contained,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = ~,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- Name: |&>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR |&> (
    PROCEDURE = st_geometry_overabove,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = &<|,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


--
-- Name: |>>; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR |>> (
    PROCEDURE = st_geometry_above,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = <<|,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


--
-- Name: ~; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ~ (
    PROCEDURE = st_geometry_contain,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = @,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


--
-- Name: ~=; Type: OPERATOR; Schema: public; Owner: -
--

CREATE OPERATOR ~= (
    PROCEDURE = st_geometry_same,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = ~=,
    RESTRICT = eqsel,
    JOIN = eqjoinsel
);


--
-- Name: btree_geometry_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS btree_geometry_ops
    DEFAULT FOR TYPE geometry USING btree AS
    OPERATOR 1 <(geometry,geometry) ,
    OPERATOR 2 <=(geometry,geometry) ,
    OPERATOR 3 =(geometry,geometry) ,
    OPERATOR 4 >=(geometry,geometry) ,
    OPERATOR 5 >(geometry,geometry) ,
    FUNCTION 1 geometry_cmp(geometry,geometry);


--
-- Name: gist_geometry_ops; Type: OPERATOR CLASS; Schema: public; Owner: -
--

CREATE OPERATOR CLASS gist_geometry_ops
    DEFAULT FOR TYPE geometry USING gist AS
    STORAGE box2d ,
    OPERATOR 1 <<(geometry,geometry) RECHECK ,
    OPERATOR 2 &<(geometry,geometry) RECHECK ,
    OPERATOR 3 &&(geometry,geometry) RECHECK ,
    OPERATOR 4 &>(geometry,geometry) RECHECK ,
    OPERATOR 5 >>(geometry,geometry) RECHECK ,
    OPERATOR 6 ~=(geometry,geometry) RECHECK ,
    OPERATOR 7 ~(geometry,geometry) RECHECK ,
    OPERATOR 8 @(geometry,geometry) RECHECK ,
    OPERATOR 9 &<|(geometry,geometry) RECHECK ,
    OPERATOR 10 <<|(geometry,geometry) RECHECK ,
    OPERATOR 11 |>>(geometry,geometry) RECHECK ,
    OPERATOR 12 |&>(geometry,geometry) RECHECK ,
    FUNCTION 1 lwgeom_gist_consistent(internal,geometry,integer) ,
    FUNCTION 2 lwgeom_gist_union(bytea,internal) ,
    FUNCTION 3 lwgeom_gist_compress(internal) ,
    FUNCTION 4 lwgeom_gist_decompress(internal) ,
    FUNCTION 5 lwgeom_gist_penalty(internal,internal,internal) ,
    FUNCTION 6 lwgeom_gist_picksplit(internal,internal) ,
    FUNCTION 7 lwgeom_gist_same(box2d,box2d,internal);


SET search_path = pg_catalog;

--
-- Name: CAST (public.box2d AS public.box3d); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.box2d AS public.box3d) WITH FUNCTION public.st_box3d(public.box2d) AS IMPLICIT;


--
-- Name: CAST (public.box2d AS public.geometry); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.box2d AS public.geometry) WITH FUNCTION public.st_geometry(public.box2d) AS IMPLICIT;


--
-- Name: CAST (public.box3d AS box); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.box3d AS box) WITH FUNCTION public.st_box(public.box3d) AS IMPLICIT;


--
-- Name: CAST (public.box3d AS public.box2d); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.box3d AS public.box2d) WITH FUNCTION public.st_box2d(public.box3d) AS IMPLICIT;


--
-- Name: CAST (public.box3d AS public.geometry); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.box3d AS public.geometry) WITH FUNCTION public.st_geometry(public.box3d) AS IMPLICIT;


--
-- Name: CAST (bytea AS public.geometry); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (bytea AS public.geometry) WITH FUNCTION public.st_geometry(bytea) AS IMPLICIT;


--
-- Name: CAST (public.chip AS public.geometry); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.chip AS public.geometry) WITH FUNCTION public.st_geometry(public.chip) AS IMPLICIT;


--
-- Name: CAST (public.geometry AS box); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.geometry AS box) WITH FUNCTION public.st_box(public.geometry) AS IMPLICIT;


--
-- Name: CAST (public.geometry AS public.box2d); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.geometry AS public.box2d) WITH FUNCTION public.st_box2d(public.geometry) AS IMPLICIT;


--
-- Name: CAST (public.geometry AS public.box3d); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.geometry AS public.box3d) WITH FUNCTION public.st_box3d(public.geometry) AS IMPLICIT;


--
-- Name: CAST (public.geometry AS bytea); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.geometry AS bytea) WITH FUNCTION public.st_bytea(public.geometry) AS IMPLICIT;


--
-- Name: CAST (public.geometry AS text); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (public.geometry AS text) WITH FUNCTION public.st_text(public.geometry) AS IMPLICIT;


--
-- Name: CAST (text AS public.geometry); Type: CAST; Schema: pg_catalog; Owner: -
--

CREATE CAST (text AS public.geometry) WITH FUNCTION public.st_geometry(text) AS IMPLICIT;


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: adjudicatarios; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE adjudicatarios (
    id integer NOT NULL,
    cif character varying(255),
    nombre character varying(255),
    direction text,
    poblacion character varying(255),
    cp character varying(255),
    tlf character varying(255),
    fax character varying(255),
    email character varying(255),
    web text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    the_geom geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((geometrytype(the_geom) = 'POINT'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((st_srid(the_geom) = 4326))
);


--
-- Name: adjudicatarios_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE adjudicatarios_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: adjudicatarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE adjudicatarios_id_seq OWNED BY adjudicatarios.id;


--
-- Name: comentarios; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE comentarios (
    id integer NOT NULL,
    usuario_id integer,
    licitacion_id integer,
    tipo_licitacion_id integer,
    comentario text,
    is_vote boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    the_geom geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((geometrytype(the_geom) = 'POINT'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((st_srid(the_geom) = 4326))
);


--
-- Name: comentarios_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE comentarios_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: comentarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE comentarios_id_seq OWNED BY comentarios.id;


--
-- Name: comunidad_autonomas; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE comunidad_autonomas (
    id integer NOT NULL,
    nombre character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: comunidad_autonomas_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE comunidad_autonomas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: comunidad_autonomas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE comunidad_autonomas_id_seq OWNED BY comunidad_autonomas.id;


--
-- Name: estados; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE estados (
    id integer NOT NULL,
    nombre character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: estados_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE estados_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: estados_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE estados_id_seq OWNED BY estados.id;


--
-- Name: fuente_datos; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE fuente_datos (
    id integer NOT NULL,
    nombre character varying(255),
    ultima_importacion timestamp without time zone,
    web text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: fuente_datos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE fuente_datos_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: fuente_datos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE fuente_datos_id_seq OWNED BY fuente_datos.id;


SET default_with_oids = true;

--
-- Name: geometry_columns; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE geometry_columns (
    f_table_catalog character varying(256) NOT NULL,
    f_table_schema character varying(256) NOT NULL,
    f_table_name character varying(256) NOT NULL,
    f_geometry_column character varying(256) NOT NULL,
    coord_dimension integer NOT NULL,
    srid integer NOT NULL,
    type character varying(30) NOT NULL
);


SET default_with_oids = false;

--
-- Name: licitacion_adjudicatarios; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE licitacion_adjudicatarios (
    id integer NOT NULL,
    licitacion_id integer,
    adjudicatario_id integer,
    importe double precision,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: licitacion_adjudicatarios_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE licitacion_adjudicatarios_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: licitacion_adjudicatarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE licitacion_adjudicatarios_id_seq OWNED BY licitacion_adjudicatarios.id;


--
-- Name: licitacions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE licitacions (
    id integer NOT NULL,
    organo_convocante_id integer,
    expediente character varying(255),
    tipo_procedimiento_id integer,
    tipo_licitacion_id integer,
    importe double precision,
    fecha_publicacion timestamp without time zone,
    fecha_adjudicacion timestamp without time zone,
    titulo character varying(255),
    descripcion text,
    codigo_cpv_ppal character varying(255),
    estado_id integer,
    url_licitacion text,
    votes_up integer DEFAULT 0,
    votes_down integer DEFAULT 0,
    num_comentarios integer DEFAULT 0,
    ref_publicacion text,
    fuente_datos_id integer,
    programa_financion_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    the_geom geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((geometrytype(the_geom) = 'POINT'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((st_srid(the_geom) = 4326))
);


--
-- Name: licitacions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE licitacions_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: licitacions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE licitacions_id_seq OWNED BY licitacions.id;


--
-- Name: organisations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE organisations (
    id integer NOT NULL,
    name character varying(255),
    parent_id integer,
    lft integer,
    rgt integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: organisations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE organisations_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: organisations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE organisations_id_seq OWNED BY organisations.id;


--
-- Name: organo_convocantes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE organo_convocantes (
    id integer NOT NULL,
    perfil_contratante_id integer,
    nombre text,
    direccion character varying(255),
    poblacion character varying(255),
    cp character varying(255),
    tlf character varying(255),
    fax character varying(255),
    email character varying(255),
    web text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: organo_convocantes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE organo_convocantes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: organo_convocantes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE organo_convocantes_id_seq OWNED BY organo_convocantes.id;


--
-- Name: partido_politicos; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE partido_politicos (
    id integer NOT NULL,
    nombre character varying(255),
    siglas character varying(255),
    web text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: partido_politicos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE partido_politicos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: partido_politicos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE partido_politicos_id_seq OWNED BY partido_politicos.id;


--
-- Name: perfil_contratantes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE perfil_contratantes (
    id integer NOT NULL,
    tipo_perfil_contratante_id integer,
    nombre character varying(255),
    cif character varying(255),
    wikipedia_url text,
    partido_politico_id integer,
    foto text,
    escudo text,
    habitantes integer,
    alcalde_voota_link text,
    provincia_id integer,
    comunidad_autonoma_id integer,
    direccion text,
    poblacion text,
    cp character varying(255),
    tlf character varying(255),
    fax character varying(255),
    web text,
    email character varying(255),
    presupuesto_total double precision,
    presupuesto_url text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    the_geom geometry,
    CONSTRAINT enforce_dims_the_geom CHECK ((st_ndims(the_geom) = 2)),
    CONSTRAINT enforce_geotype_the_geom CHECK (((geometrytype(the_geom) = 'POINT'::text) OR (the_geom IS NULL))),
    CONSTRAINT enforce_srid_the_geom CHECK ((st_srid(the_geom) = 4326))
);


--
-- Name: perfil_contratantes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE perfil_contratantes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: perfil_contratantes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE perfil_contratantes_id_seq OWNED BY perfil_contratantes.id;


--
-- Name: programa_financiacions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE programa_financiacions (
    id integer NOT NULL,
    nombre character varying(255),
    nivel character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: programa_financiacions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE programa_financiacions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: programa_financiacions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE programa_financiacions_id_seq OWNED BY programa_financiacions.id;


--
-- Name: provincias; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE provincias (
    id integer NOT NULL,
    nombre character varying(255),
    comunidad_autonoma_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: provincias_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE provincias_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: provincias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE provincias_id_seq OWNED BY provincias.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: spatial_ref_sys; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE spatial_ref_sys (
    srid integer NOT NULL,
    auth_name character varying(256),
    auth_srid integer,
    srtext character varying(2048),
    proj4text character varying(2048)
);


--
-- Name: tipo_licitacions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE tipo_licitacions (
    id integer NOT NULL,
    nombre character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: tipo_licitacions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tipo_licitacions_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: tipo_licitacions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tipo_licitacions_id_seq OWNED BY tipo_licitacions.id;


--
-- Name: tipo_perfil_contratantes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE tipo_perfil_contratantes (
    id integer NOT NULL,
    nombre character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: tipo_perfil_contratantes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tipo_perfil_contratantes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: tipo_perfil_contratantes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tipo_perfil_contratantes_id_seq OWNED BY tipo_perfil_contratantes.id;


--
-- Name: tipo_procedimientos; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE tipo_procedimientos (
    id integer NOT NULL,
    nombre character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: tipo_procedimientos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tipo_procedimientos_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: tipo_procedimientos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tipo_procedimientos_id_seq OWNED BY tipo_procedimientos.id;


--
-- Name: usuarios; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE usuarios (
    id integer NOT NULL,
    token character varying(255),
    nombre character varying(255),
    email character varying(255),
    web text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE usuarios_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE usuarios_id_seq OWNED BY usuarios.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE adjudicatarios ALTER COLUMN id SET DEFAULT nextval('adjudicatarios_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE comentarios ALTER COLUMN id SET DEFAULT nextval('comentarios_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE comunidad_autonomas ALTER COLUMN id SET DEFAULT nextval('comunidad_autonomas_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE estados ALTER COLUMN id SET DEFAULT nextval('estados_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE fuente_datos ALTER COLUMN id SET DEFAULT nextval('fuente_datos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE licitacion_adjudicatarios ALTER COLUMN id SET DEFAULT nextval('licitacion_adjudicatarios_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE licitacions ALTER COLUMN id SET DEFAULT nextval('licitacions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE organisations ALTER COLUMN id SET DEFAULT nextval('organisations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE organo_convocantes ALTER COLUMN id SET DEFAULT nextval('organo_convocantes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE partido_politicos ALTER COLUMN id SET DEFAULT nextval('partido_politicos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE perfil_contratantes ALTER COLUMN id SET DEFAULT nextval('perfil_contratantes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE programa_financiacions ALTER COLUMN id SET DEFAULT nextval('programa_financiacions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE provincias ALTER COLUMN id SET DEFAULT nextval('provincias_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE tipo_licitacions ALTER COLUMN id SET DEFAULT nextval('tipo_licitacions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE tipo_perfil_contratantes ALTER COLUMN id SET DEFAULT nextval('tipo_perfil_contratantes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE tipo_procedimientos ALTER COLUMN id SET DEFAULT nextval('tipo_procedimientos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE usuarios ALTER COLUMN id SET DEFAULT nextval('usuarios_id_seq'::regclass);


--
-- Name: adjudicatarios_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY adjudicatarios
    ADD CONSTRAINT adjudicatarios_pkey PRIMARY KEY (id);


--
-- Name: comentarios_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY comentarios
    ADD CONSTRAINT comentarios_pkey PRIMARY KEY (id);


--
-- Name: comunidad_autonomas_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY comunidad_autonomas
    ADD CONSTRAINT comunidad_autonomas_pkey PRIMARY KEY (id);


--
-- Name: estados_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY estados
    ADD CONSTRAINT estados_pkey PRIMARY KEY (id);


--
-- Name: fuente_datos_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY fuente_datos
    ADD CONSTRAINT fuente_datos_pkey PRIMARY KEY (id);


--
-- Name: geometry_columns_pk; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY geometry_columns
    ADD CONSTRAINT geometry_columns_pk PRIMARY KEY (f_table_catalog, f_table_schema, f_table_name, f_geometry_column);


--
-- Name: licitacion_adjudicatarios_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY licitacion_adjudicatarios
    ADD CONSTRAINT licitacion_adjudicatarios_pkey PRIMARY KEY (id);


--
-- Name: licitacions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY licitacions
    ADD CONSTRAINT licitacions_pkey PRIMARY KEY (id);


--
-- Name: organisations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY organisations
    ADD CONSTRAINT organisations_pkey PRIMARY KEY (id);


--
-- Name: organo_convocantes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY organo_convocantes
    ADD CONSTRAINT organo_convocantes_pkey PRIMARY KEY (id);


--
-- Name: partido_politicos_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY partido_politicos
    ADD CONSTRAINT partido_politicos_pkey PRIMARY KEY (id);


--
-- Name: perfil_contratantes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY perfil_contratantes
    ADD CONSTRAINT perfil_contratantes_pkey PRIMARY KEY (id);


--
-- Name: programa_financiacions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY programa_financiacions
    ADD CONSTRAINT programa_financiacions_pkey PRIMARY KEY (id);


--
-- Name: provincias_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY provincias
    ADD CONSTRAINT provincias_pkey PRIMARY KEY (id);


--
-- Name: spatial_ref_sys_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY spatial_ref_sys
    ADD CONSTRAINT spatial_ref_sys_pkey PRIMARY KEY (srid);


--
-- Name: tipo_licitacions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY tipo_licitacions
    ADD CONSTRAINT tipo_licitacions_pkey PRIMARY KEY (id);


--
-- Name: tipo_perfil_contratantes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY tipo_perfil_contratantes
    ADD CONSTRAINT tipo_perfil_contratantes_pkey PRIMARY KEY (id);


--
-- Name: tipo_procedimientos_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY tipo_procedimientos
    ADD CONSTRAINT tipo_procedimientos_pkey PRIMARY KEY (id);


--
-- Name: usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- Name: index_adjudicatarios_on_cif; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_adjudicatarios_on_cif ON adjudicatarios USING btree (cif);


--
-- Name: index_comentarios_on_licitacion_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_comentarios_on_licitacion_id ON comentarios USING btree (licitacion_id);


--
-- Name: index_comentarios_on_tipo_licitacion_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_comentarios_on_tipo_licitacion_id ON comentarios USING btree (tipo_licitacion_id);


--
-- Name: index_comentarios_on_usario_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_comentarios_on_usario_id ON comentarios USING btree (usuario_id);


--
-- Name: index_licitacion_adjudicatarios_on_adjudicatario_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_licitacion_adjudicatarios_on_adjudicatario_id ON licitacion_adjudicatarios USING btree (adjudicatario_id);


--
-- Name: index_licitacion_adjudicatarios_on_licitacion_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_licitacion_adjudicatarios_on_licitacion_id ON licitacion_adjudicatarios USING btree (licitacion_id);


--
-- Name: index_licitacions_on_codigo_cpv_ppal; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_licitacions_on_codigo_cpv_ppal ON licitacions USING btree (codigo_cpv_ppal);


--
-- Name: index_licitacions_on_estado_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_licitacions_on_estado_id ON licitacions USING btree (estado_id);


--
-- Name: index_licitacions_on_expediente; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_licitacions_on_expediente ON licitacions USING btree (expediente);


--
-- Name: index_licitacions_on_fuente_datos_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_licitacions_on_fuente_datos_id ON licitacions USING btree (fuente_datos_id);


--
-- Name: index_licitacions_on_importe; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_licitacions_on_importe ON licitacions USING btree (importe);


--
-- Name: index_licitacions_on_organo_convocante_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_licitacions_on_organo_convocante_id ON licitacions USING btree (organo_convocante_id);


--
-- Name: index_licitacions_on_programa_financion_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_licitacions_on_programa_financion_id ON licitacions USING btree (programa_financion_id);


--
-- Name: index_licitacions_on_tipo_licitacion_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_licitacions_on_tipo_licitacion_id ON licitacions USING btree (tipo_licitacion_id);


--
-- Name: index_licitacions_on_tipo_procedimiento_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_licitacions_on_tipo_procedimiento_id ON licitacions USING btree (tipo_procedimiento_id);


--
-- Name: index_licitacions_on_titulo; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_licitacions_on_titulo ON licitacions USING btree (titulo);


--
-- Name: index_organo_convocantes_on_perfil_contratante_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_organo_convocantes_on_perfil_contratante_id ON organo_convocantes USING btree (perfil_contratante_id);


--
-- Name: index_perfil_contratantes_on_cif; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_perfil_contratantes_on_cif ON perfil_contratantes USING btree (cif);


--
-- Name: index_perfil_contratantes_on_comunidad_autonoma_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_perfil_contratantes_on_comunidad_autonoma_id ON perfil_contratantes USING btree (comunidad_autonoma_id);


--
-- Name: index_perfil_contratantes_on_partido_politico_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_perfil_contratantes_on_partido_politico_id ON perfil_contratantes USING btree (partido_politico_id);


--
-- Name: index_perfil_contratantes_on_provincia_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_perfil_contratantes_on_provincia_id ON perfil_contratantes USING btree (provincia_id);


--
-- Name: index_perfil_contratantes_on_tipo_perfil_contratante_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_perfil_contratantes_on_tipo_perfil_contratante_id ON perfil_contratantes USING btree (tipo_perfil_contratante_id);


--
-- Name: index_usuarios_on_email; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_usuarios_on_email ON usuarios USING btree (email);


--
-- Name: index_usuarios_on_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_usuarios_on_token ON usuarios USING btree (token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

INSERT INTO schema_migrations (version) VALUES ('20100512134700');

INSERT INTO schema_migrations (version) VALUES ('20100512134744');

INSERT INTO schema_migrations (version) VALUES ('20100512134805');

INSERT INTO schema_migrations (version) VALUES ('20100512134819');

INSERT INTO schema_migrations (version) VALUES ('20100512134843');

INSERT INTO schema_migrations (version) VALUES ('20100512135028');

INSERT INTO schema_migrations (version) VALUES ('20100512135113');

INSERT INTO schema_migrations (version) VALUES ('20100512135214');

INSERT INTO schema_migrations (version) VALUES ('20100512135331');

INSERT INTO schema_migrations (version) VALUES ('20100512135522');

INSERT INTO schema_migrations (version) VALUES ('20100512135537');

INSERT INTO schema_migrations (version) VALUES ('20100512135559');

INSERT INTO schema_migrations (version) VALUES ('20100512135609');

INSERT INTO schema_migrations (version) VALUES ('20100512135621');

INSERT INTO schema_migrations (version) VALUES ('20100512135628');

INSERT INTO schema_migrations (version) VALUES ('20100512135842');

INSERT INTO schema_migrations (version) VALUES ('20100512163007');

INSERT INTO schema_migrations (version) VALUES ('20100512183603');

INSERT INTO schema_migrations (version) VALUES ('20100512221114');

INSERT INTO schema_migrations (version) VALUES ('20100514131835');

INSERT INTO schema_migrations (version) VALUES ('20100514132333');