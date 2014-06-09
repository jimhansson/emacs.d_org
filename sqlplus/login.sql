REMARK this is my default login script for sqlplus

set tab on
-- we use wordwarp in emacs if needed
set linesize 20000
-- only headers once every 500 lines
set pagesize 500

-- whitespace at end of lines are trimed
set trimout on

-- if no more than X lines are returned then do not show a count
set feedback 6

-- this might give problems with sqli-mode
set sqlprompt "_USER SQL>"

def _editor=c:\user\jiha\emacs24.3\emacsclientw.exe

-- make dates somewhat readable
alter session set nls_date_format = 'yyyy-mm-dd hh:mi:ss';


-- somethings are better moved to sql-login-hook, but it is only run once in a new buffer
-- so we might need to handle reconnects someway or I need to learn to do my reconnects in
-- sqlplus instead of using emacs.


-- Some common colums that are way to wide for showing all the data on screen
column descript format a30
column description format a30
column name format a30
column info format a30
column position format a30

column descript noprint
column description noprint
column info noprint
column position noprint
column location noprint
