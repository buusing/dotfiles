SET global general_log = 1;
SET global log_output = 'table';

select * from mysql.general_log;

SET global general_log = 0;

TRUNCATE mysql.general_log;