-- 'm very new to mysql and this seems like a fun way to
-- learn it. Not very sure, but looks like it has enough
-- capabilities for solving Knuth algorithms.
CREATE DATABASE IF NOT EXISTS art;
USE art;
delimiter //
drop procedure if exists gcd//
create procedure gcd( m int, n int)
begin
    drop table if exists Euclid;
    CREATE TABLE IF NOT EXISTS Euclid(
    eu_j INT( 2) UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
    eu_m INT( 6) UNSIGNED NOT NULL,
    eu_n INT( 6) UNSIGNED NOT NULL,
    eu_r INT( 6) UNSIGNED); -- reminder of m/n
    repeat
        set @r = m % n;
        INSERT INTO Euclid VALUES( eu_j, m, n, @r);
        set m = n;
        set n = @r;
        until n = 0 end repeat;
end//
delimiter ;
call gcd( 2166, 6099);
select * from Euclid;
-- -----+------+------+------+------+-------------------
-- log: | eu_j | eu_m | eu_n | eu_r |
--      +------+------+------+------+
--      |    1 | 2166 | 6099 | 2166 |
--      |    2 | 6099 | 2166 | 1767 |
--      |    3 | 2166 | 1767 |  399 |
--      |    4 | 1767 |  399 |  171 |
--      |    5 |  399 |  171 |   57 |
--      |    6 |  171 |   57 |    0 |
--      +------+------+------+------+
