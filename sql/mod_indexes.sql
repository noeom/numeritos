SELECT e.type as type, MIN(e.id) as start, MAX(e.id) as end
FROM exercises e
GROUP BY e.type
ORDER BY e.type;
