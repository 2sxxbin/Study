SELECT * FROM kimsql.brnch_info;

# 1. BRNCH_INFO 테이블을 사용하여 직원 수가 10명 이상이고 경영평가가 'C'인 영업점 번호, 영업점 이름, 영업점 인원, 경영평가를 나타내보자.
SELECT ﻿BRNCH_NO, BRNCH_NM, BRNCH_NUM, BRNCH_PERF
FROM kimsql.brnch_info
where BRNCH_NUM >= 10 AND BRNCH_PERF = 'C';

# 2. BRNCH_INFO 테이블을 사용하여 직원 수가 10명 이상이고 경영평가가 'C'이면서 영업점이 폐쇄된 영업점 번호, 영업점 이름, 영업점 인원, 경영평가를 나타내보자.
# 2-1.
SELECT ﻿BRNCH_NO, BRNCH_NM, BRNCH_NUM, BRNCH_PERF
FROM kimsql.brnch_info
where BRNCH_NUM >= 10
	AND BRNCH_PERF = 'C'
	AND CLOSE_DT != '';

# 2-2.
SELECT ﻿BRNCH_NO, BRNCH_NM, CLOSE_DT, BRNCH_NUM, BRNCH_PERF
FROM kimsql.brnch_info
where BRNCH_NUM >= 10
	AND BRNCH_PERF = 'C'
	AND CLOSE_DT IS NOT NULL;
    
# 3. BRNCH_INFO 테이블을 사용하여 직원 수가 10명 이상이거나 경영평가가 'A'인 영업점 번호, 영업점 이름, 영업점 인원, 경영평가를 나타내보자.
SELECT ﻿BRNCH_NO, BRNCH_NM, BRNCH_NUM, BRNCH_PERF
FROM kimsql.brnch_info
WHERE BRNCH_NUM >= 10 OR BRNCH_PERF = 'A';

# 4. BRNCH_INFO 테이블을 사용하여 직원 수가 8명 이상이거나 경영평가가 'A'이거나 영업점이 폐쇄된 영업점 번호, 영업점 이름, 영업점 인원, 경영평가를 나타내보자.
SELECT ﻿BRNCH_NO, BRNCH_NM, BRNCH_NUM, BRNCH_PERF
FROM kimsql.brnch_info
WHERE BRNCH_NUM >= 8
	OR BRNCH_PERF = 'A'
    OR CLOSE_DT IS NOT NULL;
    
# 5. 괗로를 사용하지 않았을 때 연산자 우선순위
SELECT *
FROM kimsql.brnch_info
WHERE CAST(OPEN_DT AS DATE) <= '1999-12-31'
	OR BRNCH_NUM = 8
    AND BRNCH_PERF = 'A';
    
# 6. 괄호를 사용했을 때 연산자의 우선순위
SELECT *
FROM kimsql.brnch_info
WHERE (CAST(OPEN_DT AS DATE) <= '1999-12-31' OR BRNCH_NUM = 8)
    AND BRNCH_PERF = 'A';
    
# 7. BRNCH_INFO 테이블을 사용하여 직원 수가 10명 또는 8명이면서 경영평가가 'A' 또는 'B'인 영업점 번호, 영업점 이름, 영업점 인원, 경영평가를 나타내보자.
SELECT ﻿BRNCH_NO, BRNCH_NM, BRNCH_NUM, BRNCH_PERF
FROM kimsql.brnch_info
WHERE BRNCH_NUM IN (10, 8)
	AND BRNCH_PERF IN ('A', 'B');

# 8. BRNCH_INFO 테이블을 사용하여 폐쇄되었거나 2000년도 이전에 신설한 영업점 중 경영평가가 'A'가 아닌 영업점의 영업점 번호, 영업점 이름, 영업점 신설일, 영업점 폐쇄일, 경영평가를 나타내보자.
# 8-1.
SELECT ﻿BRNCH_NO, BRNCH_NM, OPEN_DT, CLOSE_DT, BRNCH_PERF
FROM kimsql.brnch_info
WHERE (CLOSE_DT != '' OR CAST(OPEN_DT AS DATE) <= '2000-01-01')
	AND BRNCH_PERF != 'A';
    
#8-2.
SELECT ﻿BRNCH_NO, BRNCH_NM, OPEN_DT, CLOSE_DT, BRNCH_PERF
FROM kimsql.brnch_info
WHERE (CLOSE_DT <> '' OR CAST(OPEN_DT AS DATE) <= '2000-01-01')
	AND BRNCH_PERF NOT IN ('A');

SELECT * FROM kimsql.perf_mast_201312;
# 9. 소매 기반 사업을 하다보면 비활성화 고객을 예측하고 활성화 고객을 증대시키는 일은 매우 중요하다.
	# PERF_MAST_201312는 직전 3개월 동안의 카드사용금액을 알려주는 테이블이다.
    # 비활성화 고객은 직전 3개월 연속 카드사용금액이 1만원 이하인 고객을 의미한다고 할 때, 이 테이블을 통해서 비활성화 고객을 찾아보자.
# 9-1.
SELECT ﻿CMF, PARTY_NM, TOT_AMT_1, TOT_AMT_2, TOT_AMT_3
FROM kimsql.perf_mast_201312
WHERE CAST(REPLACE(TOT_AMT_1, ',', '') AS decimal) <= 10000
	AND CAST(REPLACE(TOT_AMT_2, ',', '') AS decimal) <= 10000
    AND CAST(REPLACE(TOT_AMT_3, ',', '') AS decimal) <= 10000;

# 9-2.
SELECT ﻿CMF, PARTY_NM, TOT_AMT_1, TOT_AMT_2, TOT_AMT_3
FROM kimsql.perf_mast_201312
WHERE COALESCE(CAST(REPLACE(TOT_AMT_1, ',', '') AS decimal), 0) <= 10000
	AND COALESCE(CAST(REPLACE(TOT_AMT_2, ',', '') AS decimal), 0) <= 10000
    AND COALESCE(CAST(REPLACE(TOT_AMT_3, ',', '') AS decimal), 0) <= 10000;

# 10. 만약 PB 고객이면서 비활성화 고객에게 일정 금액 이상 사용하면 상품권을 지급하는 활성화 캠패인을 진행하려고 한다면 어떤 고객이 그 대상이 되는지 찾아보자.
# 10-1.
SELECT *
FROM kimsql.perf_mast_201312
WHERE SEG = 'PB'
	AND CAST(REPLACE(TOT_AMT_1, ',', '') AS decimal) <= 10000
	AND CAST(REPLACE(TOT_AMT_2, ',', '') AS decimal) <= 10000
    AND CAST(REPLACE(TOT_AMT_3, ',', '') AS decimal) <= 10000;

#10-2. IN 사용
SELECT *
FROM kimsql.perf_mast_201312
WHERE SEG IN ('PB')
	AND CAST(REPLACE(TOT_AMT_1, ',', '') AS decimal) <= 10000
	AND CAST(REPLACE(TOT_AMT_2, ',', '') AS decimal) <= 10000
    AND CAST(REPLACE(TOT_AMT_3, ',', '') AS decimal) <= 10000;

# 11. 직전 3개월 동안 카드 사용금액이 계속 줄어드는 고객 중 직전 3개월 총 사용 금액이 7천원 이상인 고객은 비활성화될 가능성이 높으면서 활성화 캠페인에 대한 반응률도 높은 고객군이라고 하자
	# 어떤 고객이 그 대상이 되는지 찾아보자.
SELECT ﻿CMF, PARTY_NM, TOT_AMT_1, TOT_AMT_2, TOT_AMT_3
FROM kimsql.perf_mast_201312
WHERE CAST(REPLACE(TOT_AMT_3, ',', '') AS decimal) > CAST(REPLACE(TOT_AMT_2, ',', '') AS decimal)
	AND CAST(REPLACE(TOT_AMT_2, ',', '') AS decimal) > CAST(REPLACE(TOT_AMT_1, ',', '') AS decimal)
    AND CAST(REPLACE(TOT_AMT_1, ',', '') AS decimal) + CAST(REPLACE(TOT_AMT_2, ',', '') AS decimal) + CAST(REPLACE(TOT_AMT_3, ',', '') AS decimal) >= 7000;