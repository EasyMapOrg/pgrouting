/*PGR-GNU*****************************************************************
File: dijkstraViaVertex.sql

Generated with Template by:
Copyright (c) 2015 pgRouting developers

Function's developer:
Copyright (c) 2015 Celia Virginia Vergara Castillo

------

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

********************************************************************PGR-GNU*/

------------------
-- pgr_dijkstraVia
------------------

CREATE OR REPLACE FUNCTION _pgr_dijkstraVia(
    edges_sql TEXT,
    via_vids ANYARRAY,
    directed BOOLEAN,
    strict BOOLEAN,
    U_turn_on_edge BOOLEAN,


    OUT seq INTEGER,
    OUT path_id INTEGER,
    OUT path_seq INTEGER,
    OUT start_vid BIGINT,
    OUT end_vid BIGINT,
    OUT node BIGINT,
    OUT edge BIGINT,
    OUT cost FLOAT,
    OUT agg_cost FLOAT,
    OUT route_agg_cost FLOAT)
RETURNS SETOF RECORD AS
'MODULE_PATHNAME', 'dijkstraVia'
LANGUAGE c VOLATILE STRICT;


CREATE OR REPLACE FUNCTION pgr_dijkstraVia(
    TEXT,     -- edges_sql (required)
    ANYARRAY, -- via_vids (required)
    directed BOOLEAN DEFAULT TRUE,
    strict BOOLEAN DEFAULT FALSE,
    U_turn_on_edge BOOLEAN DEFAULT TRUE,


    OUT seq INTEGER,
    OUT path_id INTEGER,
    OUT path_seq INTEGER,
    OUT start_vid BIGINT,
    OUT end_vid BIGINT,
    OUT node BIGINT,
    OUT edge BIGINT,
    OUT cost FLOAT,
    OUT agg_cost FLOAT,
    OUT route_agg_cost FLOAT)
RETURNS SETOF RECORD AS
$BODY$
    SELECT *
    FROM _pgr_dijkstraVia(_pgr_get_statement($1), $2, $3 , $4, $5);
$BODY$
LANGUAGE SQL VOLATILE STRICT
COST 100
ROWS 1000;

COMMENT ON FUNCTION pgr_dijkstraVia(TEXT, ANYARRAY, BOOLEAN, BOOLEAN, BOOLEAN)
IS 'pgr_dijkstraVia(edges_sql(id,source,target,cost[,reverse_cost]), via_vids, [,directed, strict, U_turn_on_edge])';
