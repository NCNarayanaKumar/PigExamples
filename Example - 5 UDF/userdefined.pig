--Question: 
--To convert the all letters to upper case letters 
-- for this we don't have pig inbuilt function.. so we should create a UDF for it.

--Description:
--step 1: = we want to create a java (jar) file - to convert all letters to upper cases
--	    in a java package and register in Pig shell by REGISTER keyword.
--step 2: = we want to DEFINE a function name, here the function name is convertlowertoupper
--	    and we want to specify package name(myudfs) and class name (UPPER).
--step 3: = we want to load the data to be tested.
--step 4: = we want to write a query and specify the function in it.

REGISTER /home/bala/pigudf.jar
DEFINE convertlowertoupper myudfs.UPPER();
bag1 = load '/home/bala/book1.txt' using PigStorage() as (name:chararray);
bag2 = foreach bag1 generate convertlowertoupper (name);
dump bag2;
