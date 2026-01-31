-- CONSULTAS DE BASE DE DATOS CHICAGO TAXI

-- Ejercicio 1: Conteo total de vehículos en la flota
SELECT COUNT(*) FROM cabs;

-- Ejercicio 2: Identificación de compañías con flotas pequeñas (menos de 100)
SELECT 
    company_name, 
    COUNT(*) AS cnt 
FROM 
    cabs 
GROUP BY 
    company_name 
HAVING 
    COUNT(*) < 100 
ORDER BY 
    cnt DESC;

-- Ejercicio 4: Análisis de viajes por compañía (15-16 Nov 2017)
-- Este query es vital para comparar las ganancias reportadas vs la demanda real.
SELECT 
    c.company_name, 
    COUNT(t.trip_id) AS trips_amount 
FROM 
    cabs AS c 
INNER JOIN 
    trips AS t ON c.cab_id = t.cab_id 
WHERE 
    CAST(t.start_ts AS date) BETWEEN '2017-11-15' AND '2017-11-16' 
GROUP BY 
    c.company_name 
ORDER BY 
    trips_amount DESC;
