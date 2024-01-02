SELECT * FROM kimsql.purchase_tran;

# 1. 가입금액이 1백만원 이상인 고객들의 고객번호, 계약번호, 가입금액을 추출해보자.


# 2. 상품명이 '다이렉트자동차보험'인 고객들의 고객번호, 계약일, 상품명을 추출하고 고객번호는 오름차순으로 정렬해보자


# 3. 상품 계약일이 2013년 04월 16일 이후인 고객들의 고객번호, 계약일, 상품명을 추출하고 고객번호는 오름차순으로 정렬해보자 


# 4. PURCHASE_TRAN 테이블에서 올해 구입금액이 1백만원 이상인 고객의 고객 번호와 올해 구입금액을 나타내보자
SELECT ﻿ID, PURCHASE_AMT
FROM kimsql.purchase_tran
where CAST(replace(PURCHASE_AMT, ',', '') AS DECIMAL) >= 1000000;
 # 데이터 타입 변환 작업
  # REPLACE(PURCHASE_AMT, ',', '') : 열에서 쉼표를 찾아 없애는 역할
  # CAST(... AS DECIMAL) : 나머지 값을 숫자(DEMICAL)로 변환하는 역할, 변환 작업을 위해 'CAST' 함수 사용, 'AS DECIMAL'은 변환하고자 하는 데이터 타입 나타냄
  
# 5. PURCHASE_TRAN 테이블에서 작년 구입금액이 1백만원 이상 5천만원 이하의 고객의 고객번호와 작년 구입금액을 나타내보자.
# 5-1.
SELECT ﻿ID, LAST_AMT
FROM kimsql.purchase_tran
WHERE CAST(REPLACE(LAST_AMT, ',', '') AS DECIMAL) between 1000000 AND 50000000;

# 5-2
SELECT ﻿ID, LAST_AMT
FROM kimsql.purchase_tran
WHERE CAST(REPLACE(LAST_AMT, ',', '') AS DECIMAL) >= 1000000 AND CAST(REPLACE(LAST_AMT, ',', '') AS DECIMAL) <= 50000000;

# 6. PURCHASE_TRAN 테이블에서 올해 구입건수가 작년도 구입건수보다 많은 고객들의 고객번호, 올해 구입건수, 작년도 구입건수를 나타내고 고객번호를 기준으로 오름차순 정렬해보자
SELECT ﻿ID, PURCHASE_CNT, LAST_CNT
FROM kimsql.purchase_tran
WHERE PURCHASE_CNT > LAST_CNT
ORDER BY ﻿ID;

# 7. 올해 판매가격의 순 매출마진(Net Sales Margin)이 10%라고 가정하자. PURCHASE_TRAN 테이블에서 순이익의 별칭을 INCOME_AMT라고 사용하여 올해 고객별 순이익을 구해보자
SELECT ﻿ID, CAST(REPLACE(PURCHASE_AMT, ',', '') AS decimal)*0.1 AS INCOME_AMT
FROM kimsql.purchase_tran;

# 8. 올해 고객의 건당 구입금액을 구하고, 별칭은 TICKET_SIZE로 설정해보자
SELECT ﻿ID, CAST(REPLACE(PURCHASE_AMT, ',', '') AS decimal) / PURCHASE_CNT AS TICKET_SIZE
FROM kimsql.purchase_tran;

# 9. 보험원장 테이블(INS_INFO 테이블)에서 실제 살아있는 계약만 추출하여 고객번호, 계약번호 및 가입금액을 출력해보자


# 10. 보험원장 테이블(INS_INFO 테이블)에서 해지된 계약만 추출하여 고객번호, 계약번호 및 가입금액을 출력해보자


# 11. 산술연산자의 곱하기, 나누기는 더하기, 빼기보다 우선순위가 높다.
# 11-1. 괄호가 없을 때
SELECT ﻿ID, PURCHASE_CNT, 3*PURCHASE_CNT-100 AS CAL_AMT1
FROM kimsql.purchase_tran;

# 11-2. 괄호가 있을 때
SELECT ﻿ID, PURCHASE_CNT, 3*(PURCHASE_CNT-100) AS CAL_AMT2
FROM kimsql.purchase_tran;

SELECT * FROM kimsql.card_tran_201311;
# 12. 고객의 2013년 11월 총 신용카드사용금액을 TOT_AMT라는 열 이름을 사용해서 계산하고, 총 사용금액을 기준으로 내림차순 정렬하여라.
#     일시불 사용금액, 할부 사용금액, 해외 사용금액, 현금서비스를 더한 금액이 총 신용카드사용금액이다.
# 12-1.
SELECT ﻿CMF, PARTY_NMSEG, CAST(REPLACE(PIF_AMT, ',', '') AS decimal) + CAST(REPLACE(INST_AMT, ',', '') AS decimal) + CAST(REPLACE(OVRS_AMT, ',', '') AS decimal) + CAST(REPLACE(CASH_AMT, ',', '') AS decimal) AS TOT_AMT
FROM kimsql.card_tran_201311
ORDER BY TOT_AMT DESC;

# 12-2.
SELECT ﻿CMF, PARTY_NMSEG, (coalesce(CAST(REPLACE(PIF_AMT, ',', '') AS decimal),0) + coalesce(CAST(REPLACE(INST_AMT, ',', '') AS decimal),0) + coalesce(CAST(REPLACE(OVRS_AMT, ',', '') AS decimal),0) + coalesce(CAST(REPLACE(CASH_AMT, ',', '') AS decimal),0)) AS TOT_AMT
FROM kimsql.card_tran_201311
ORDER BY TOT_AMT DESC;

# 13. 무이자할부 기능이 강화된 신용카드를 출시 시 이 데이터를 가지고 어떻게 마케팅을 할 수 있는가?
SELECT ﻿CMF, PARTY_NMSEG, INST_AMT
FROM kimsql.card_tran_201311
WHERE INST_AMT > 0;
# -> 한 번이라도 할부를 사용했던 고객이 무이자할부 기능의 장점을 쉽게 느낄 수 있을것이므로 할부를 사용하는 고객들을 먼저 추출해야 한다.
# 결과에 따라 할부를 사용한 고객 2명에게 안내 TM을 하는 타킷 마케팅(Target marketing)이 효율적인 방법이다.

# 14. 2013년 11월 PB고객들을 대상으로 일시불 사용금액의 10%를 캐시백해주는 프로모션을 진행한다면 어떤 고객이 얼마의 캐시백을 받아야 하는지 계산하여라
SELECT ﻿CMF, PARTY_NMSEG, SEG, PIF_AMT, CAST(REPLACE(PIF_AMT, ',', '') AS decimal) * 0.1 AS REWARD_AMT
FROM kimsql.card_tran_201311
WHERE SEG = 'PB'
ORDER BY REWARD_AMT desc;


