-- -------------------------------------------------------------
create database if not exists art;
use art;
-- ____ __ ____ ____ ____ __ __ __ ________ ____ ____ ________  
-- Still   learning  how  to program        in   MySQL.
-- Most of the  time spending   in Google   trying    to
-- figure  what to   do         :  )
delimiter #
drop procedure if exists gentuple#
create procedure gentuple()
begin
    declare _u int;
    declare _v int;
    set @m = '[0, 4, 3, 2]'; -- JSON array
    set @a = '[0, 0, 0, 0]';
    set @n = JSON_LENGTH(@m);
    drop table if exists Tuples;
    CREATE TABLE Tuples(
    tp_j INT( 2) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    tp_a varchar( 20));
    THIS: loop
        insert into Tuples(tp_a)
        select @a;
        --
        set @j = @n - 1;
        THAT: loop
            set @p = CONCAT('$[', @j , ']');
            set _u = JSON_EXTRACT(@m, @p);
            set _v = JSON_EXTRACT(@a, @p);
            if _u - 1 != _v then
                leave THAT;
            end if;
            set @a = JSON_SET(@a, @p, 0);    
            set @j = @j - 1;
        end loop;
        if @j = 0 then
            leave THIS;   
        end if;
        set _v = _v + 1;
        set @a = JSON_SET(@a, @p, _v);    
    end loop;
    select * from Tuples;
end#
delimiter ;
call gentuple();
-- -------------------------------------------------------------
-- +------+--------------+
-- | tp_j | tp_a         |
-- +------+--------------+
-- |    1 | [0, 0, 0, 0] |
-- |    2 | [0, 0, 0, 1] |
-- |    3 | [0, 0, 1, 0] |
-- |    4 | [0, 0, 1, 1] |
-- |    5 | [0, 0, 2, 0] |
-- |    6 | [0, 0, 2, 1] |
-- |    7 | [0, 1, 0, 0] |
-- |    8 | [0, 1, 0, 1] |
-- |    9 | [0, 1, 1, 0] |
-- |   10 | [0, 1, 1, 1] |
-- |   11 | [0, 1, 2, 0] |
-- |   12 | [0, 1, 2, 1] |
-- |   13 | [0, 2, 0, 0] |
-- |   14 | [0, 2, 0, 1] |
-- |   15 | [0, 2, 1, 0] |
-- |   16 | [0, 2, 1, 1] |
-- |   17 | [0, 2, 2, 0] |
-- |   18 | [0, 2, 2, 1] |
-- |   19 | [0, 3, 0, 0] |
-- |   20 | [0, 3, 0, 1] |
-- |   21 | [0, 3, 1, 0] |
-- |   22 | [0, 3, 1, 1] |
-- |   23 | [0, 3, 2, 0] |
-- |   24 | [0, 3, 2, 1] |
-- +------+--------------+
