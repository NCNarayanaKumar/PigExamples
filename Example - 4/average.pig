--Question:
--To find the average claim consumed by the user from bank.
--Two datasets one(Weblog) contains cusName,BankName,time and another dataset(PaymentGatteway) contains BankName,percentage

--Description:
--step 1: loading the data.
--step 2: joining two dataset with common columns.
--step 3: grouping the data by user name. --MAPPER
--step 4: finding the average percentage of each user. --REDUCER

log = load 'Weblog.txt' using PigStorage(',') as (name,bank,time);
payment =  load 'PaymentGateway.txt' using PigStorage(',') as (bank,percentage:float);
payjoin = join log by $1, payment by $0;  
payjoingroup = group payjoin $0;
percent = foreach payjoingroup generate $0,AVG(payjoin.$4);
