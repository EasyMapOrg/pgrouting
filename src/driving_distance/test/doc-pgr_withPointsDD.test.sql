
BEGIN;

    \echo --q1
    SELECT * FROM pgr_withPointsDD(
        'SELECT id, source, target, cost, reverse_cost FROM edge_table ORDER BY id',
        'SELECT pid, edge_id, fraction, side from points',
        3, 3.0);
    \echo --q2
    SELECT * FROM pgr_withPointsDD(
        'SELECT id, source, target, cost, reverse_cost FROM edge_table ORDER BY id',
        'SELECT pid, edge_id, fraction, side from points',
        3, 3.0,
        driving_side := 'r',
        details := true);
    \echo --q3
    SELECT * FROM pgr_withPointsDD(
        'SELECT id, source, target, cost, reverse_cost FROM edge_table ORDER BY id',
        'SELECT pid, edge_id, fraction, side from points',
        3, 3.0,
        driving_side := 'l',
        details := true);
    \echo --q4
    SELECT * FROM pgr_withPointsDD(
        'SELECT id, source, target, cost, reverse_cost FROM edge_table ORDER BY id',
        'SELECT pid, edge_id, fraction, side from points',
        3, 3.0,
        driving_side := 'b',
        details := true);
    \echo --q5



    ROLLBACK;


