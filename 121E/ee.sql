-- -------------------------------------------------------------
CREATE DATABASE IF NOT EXISTS art;
USE art;
delimiter //
drop procedure if exists ee//
create procedure ee( m int, n int)
begin
    drop table if exists EXTD_EUCLID;
    CREATE TABLE EXTD_EUCLID(
        j  INT( 2) UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
        c  INT( 6) UNSIGNED NOT NULL,
        d  INT( 6) UNSIGNED NOT NULL,
        a1 INT( 6) NOT NULL,
        b1 INT( 6) NOT NULL,
        a  INT( 6) NOT NULL,
        b  INT( 6) NOT NULL
    );
    -- a1*m + b1*n = c
    -- a *m + b *n = d
    --
    set @c  = m;
    set @d  = n;
    set @a1 = 1;
    set @b1 = 0;
    set @a  = 0;
    set @b  = 1;
    this_lab: loop
        INSERT INTO EXTD_EUCLID VALUES( j, @c, @d, @a1, @b1, @a, @b);
        --
        set @q = @c div @d;
        set @r = @c mod @d;
        --
        if @r = 0 then
           leave this_lab;
        end if;
        --
        set @c = @d;
        set @d = @r;
        --
        set @t  = @a1;
        set @a1 = @a;
        set @a  = @t - @q * @a;
        --
        set @t  = @b1;
        set @b1 = @b;
        set @b  = @t - @q * @b;
    end loop this_lab;
end//
delimiter ;
call ee( 2166, 6099);
select * from EXTD_EUCLID;
-- -------------------------------------------------------------
-- log: -In the MIX machine it is clear why there are five bytes
-- and 64 commands, but why memory size is 4000 words? While was
-- diving into Python, and reading the chapter about regexp have
-- realized why, because MMMCMXCIX is the maximum possible value
-- in the Roman Numerals, and it equals M + M + M + CM + XC + IX
-- = 1000 + 1000 + 1000 + 900 + 90 + 9 = 3999.
-- +---+------+------+-----+----+-----+-----+
-- | j | c    | d    | a1  | b1 | a   | b   |
-- +---+------+------+-----+----+-----+-----+
-- | 1 | 2166 | 6099 |   1 |  0 |   0 |   1 |
-- | 2 | 6099 | 2166 |   0 |  1 |   1 |   0 |
-- | 3 | 2166 | 1767 |   1 |  0 |  -2 |   1 |
-- | 4 | 1767 |  399 |  -2 |  1 |   3 |  -1 |
-- | 5 |  399 |  171 |   3 | -1 | -14 |   5 |
-- | 6 |  171 |   57 | -14 |  5 |  31 | -11 |
-- +---+------+------+-----+----+-----+-----+
-- 31*2166 - 11*6099 = 57
--
