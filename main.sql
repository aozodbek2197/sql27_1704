-- 1-mashq
SELECT s.name
FROM students s
JOIN friends f ON s.id = f.id
JOIN packages p1 ON s.id = p1.id
JOIN packages p2 ON f.friend_id = p2.id
WHERE p2.salary > p1.salary
ORDER BY p2.salary;
-- 2-mashq
WITH ranked AS (
    SELECT 
        lat_n,
        ROW_NUMBER() OVER (ORDER BY lat_n) AS rn,
        COUNT(*) OVER () AS total
    FROM station
)
SELECT ROUND(AVG(lat_n), 4) AS median
FROM ranked
WHERE rn IN (FLOOR((total + 1)/2.0), CEIL((total + 1)/2.0));
