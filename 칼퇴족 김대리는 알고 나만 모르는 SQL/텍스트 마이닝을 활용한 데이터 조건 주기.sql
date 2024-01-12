SELECT *
FROM kimsql.`customers(고객정보 테이블)`;

# 1. CUSTOMERS 테이블을 사용하여 BER로 시작하는 도시에 거주하는 고객들을 찾아보자.
SELECT ﻿ID, name, city
from kimsql.`customers(고객정보 테이블)`
where city like 'ber%';

# 2. CUSTOMERS 테이블을 사용하여 NY로 끝나는 나라에 거주하는 고객들을 찾아보자.
SELECT *
from kimsql.`customers(고객정보 테이블)`
where country like '%ny';

# 3. CUSTOMERS 테이블을 사용하여 ES를 포함한 도시에 거주하는 고객들을 찾아보자.
SELECT *
from kimsql.`customers(고객정보 테이블)`
where city like '%es%';

# 4. CUSTOMERS 테이블을 사용하여 마지막 문자는 알 수 없지만 KORE를 포함한 나라에 거주하는 고객들을 찾아보자.
SELECT *
from kimsql.`customers(고객정보 테이블)`
where country like 'kore_';

# 5. CUSTOMERS 테이블을 사용하여 첫 번째 문자는 알 수 없지만 이름이 AM으로 끝나는 고객들을 찾아보자.
SELECT *
from kimsql.`customers(고객정보 테이블)`
where name like '_am';

# 6. CUSTOMERS 테이블을 사용하여 도시 이름이 B로 시작해서 N으로 끝나는 곳에 거주하는 고객들을 찾아보자.
SELECT *
from kimsql.`customers(고객정보 테이블)`
where city like 'B%N';

# 7. CUSTOMERS 테이블을 사용하여 도시(나라)로 표현되도록 필드를 결합하고 ADDR이라는 별칭을 주자.
SELECT *, concat(city, '(', country, ')') as ADDR
from kimsql.`customers(고객정보 테이블)`;

# 8. CUSTOMERS 테이블을 사용하여 도시(나라)로 표현되도록 필드를 결합하고 ADDR이라는 별칭을 주자. 단, 나라에 공백이 없도록 표현하자.
SELECT *, concat(city, '(', TRIM(country), ')') as ADDR
FROM kimsql.`customers(고객정보 테이블)`;

SELECT * FROM kimsql.cust_perf;
# 9. 고객구매정보 CUST_PERF 테이블에서 ES라는 문자를 포함하는 도시 중 세 달 연속 구매 금액이 3백만원이 넘는 고객들을 추출해라.
SELECT *
FROM kimsql.cust_perf
WHERE CITY LIKE '%ES%'
	AND coalesce(cast(replace(TOT_AMT_1, ',', '') AS decimal), 0) >= 3000000
    AND coalesce(cast(replace(TOT_AMT_2, ',', '') AS decimal), 0) >= 3000000
    AND coalesce(cast(replace(TOT_AMT_3, ',', '') AS decimal), 0) >= 3000000;

# 10. 고객에게 감사 DM을 발송할 것이다. 맨 처음 문구가 다음과 같다면 SQL 문장을 어떻게 만들 수 있을까?
# 예시) DEAR LEE, YOUR SEGMENT IS PRIORITY IN OUR COMPANY.
select *, CONCAT('DEAR ', NAME, ', YOUR SEGMENT IS PRIORITY IN OUR COMPANY.') AS DM
FROM kimsql.cust_perf
WHERE CITY LIKE '%ES%'
	AND coalesce(cast(replace(TOT_AMT_1, ',', '') AS decimal), 0) >= 3000000
    AND coalesce(cast(replace(TOT_AMT_2, ',', '') AS decimal), 0) >= 3000000
    AND coalesce(cast(replace(TOT_AMT_3, ',', '') AS decimal), 0) >= 3000000;