-- Join the two tables so that every column and record appears, regardless of if there is not an owner_id.
SELECT 
  o.id,
  o.first_name,
  o.last_name,
  v.id,
  v.make,
  v.model,
  v.year,
  v.price,
  v.owner_id
FROM owners o
FULL OUTER JOIN vehicles v
  ON o.id = v.owner_id
ORDER BY o.id, v.id;

--  id | first_name | last_name | id |  make  |  model  | year |  price   | owner_id 
-- ----+------------+-----------+----+--------+---------+------+----------+----------
--   1 | Bob        | Hope      |  1 | Toyota | Corolla | 2002 |  2999.99 |        1
--   1 | Bob        | Hope      |  2 | Honda  | Civic   | 2012 | 12999.99 |        1
--   2 | Jane       | Smith     |  3 | Nissan | Altima  | 2016 | 23999.99 |        2
--   2 | Jane       | Smith     |  4 | Subaru | Legacy  | 2006 |  5999.99 |        2
--   3 | Melody     | Jones     |  5 | Ford   | F150    | 2012 |  2599.99 |        3
--   3 | Melody     | Jones     |  6 | GMC    | Yukon   | 2016 | 12999.99 |        3
--   4 | Sarah      | Palmer    |  7 | GMC    | Yukon   | 2014 | 22999.99 |        4
--   4 | Sarah      | Palmer    |  8 | Toyota | Avalon  | 2009 | 12999.99 |        4
--   4 | Sarah      | Palmer    |  9 | Toyota | Camry   | 2013 | 12999.99 |        4
--   5 | Alex       | Miller    | 10 | Honda  | Civic   | 2001 |  7999.99 |        :


-- Count the number of cars for each owner. Display the owners first_name , last_name and count of vehicles. The first_name should be ordered in ascending order. 
SELECT 
  o.first_name,
  o.last_name,
  COUNT(v.id) AS count
FROM owners o
JOIN vehicles v
  ON o.id = v.owner_id
GROUP BY o.first_name, o.last_name
ORDER BY o.first_name;

-- first_name | last_name | count 
-- ------------+-----------+-------
--  Alex       | Miller    |     1
--  Bob        | Hope      |     2
--  Jane       | Smith     |     2
--  Melody     | Jones     |     2
--  Sarah      | Palmer    |     3
--  Shana      | Smith     |     4
-- (6 rows)


-- Count the number of cars for each owner and display the average price for each of the cars as integers. Display the owners first_name, last_name, average price and count of vehicles. The first_name should be ordered in descending order. Only display results with more than one vehicle and an average price greater than 10000.
SELECT 
  o.first_name,
  o.last_name,
  CAST(AVG(v.price) AS INTEGER) AS average_price,
  COUNT(v.id) AS count
FROM owners o
JOIN vehicles c
  ON o.id = v.owner_id
GROUP BY o.first_name, o.last_name
HAVING COUNT(v.id) > 1 AND AVG(v.price) > 10000
ORDER BY o.first_name DESC;

--  first_name | last_name | average_price | count 
-- ------------+-----------+---------------+-------
--  Shana      | Smith     |         19875 |     4
--  Sarah      | Palmer    |         16333 |     3
--  Jane       | Smith     |         15000 |     2
-- (3 rows)
