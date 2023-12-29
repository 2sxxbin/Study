# 1. 테이블 전체 보기
SELECT * FROM kimsql.clerk;

# 2. CLERK 테이블에서 사번을 출력해보자
SELECT ﻿ID FROM kimsql.clerk;

# 3. CLERK 테이블에서 사번, 이름을 출력해보자
SELECT ﻿ID, STAFF_NM FROM kimsql.clerk;

# 4. CLERK 테이블에서 사번, 이름, 생년월일을 출력해보자
SELECT ﻿ID, STAFF_NM, BIRTH_DT FROM kimsql.clerk;

# 5. CLERK 테이블에서 모든 열을 출력해보자
# 5-1. 문자 * 사용하기
SELECT * FROM kimsql.clerk;

# 5-2. 모든 열 이름 나열하기
SELECT ﻿ID, STAFF_NM, DEP_NM, GENDER, BIRTH_DT, EMP_FLAG
FROM kimsql.clerk;

# 6. CLERK 테이블에서 이름을 기준으로 오름차순 정렬하여 이름 및 부서명을 출력해보자
# 6-1. ORDER BY 뒤에 열 이름 사용하기
SELECT STAFF_NM, DEP_NM
FROM kimsql.clerk
ORDER BY STAFF_NM;

# 6-2. ORDER BY 뒤에 열 위치 사용하기
SELECT STAFF_NM, DEP_NM
FROM kimsql.clerk
ORDER BY 1;

# 7. CLERK 테이블에서 부서명을 기준으로 오름차순 정렬하여 이름 및 부서명을 출력해보자
# 7-1. ORDER BY 뒤에 열 이름 사용하기
SELECT STAFF_NM, DEP_NM
FROM kimsql.clerk
ORDER BY 2;

# 7-2. ORDER BY 뒤에 열 위치 사용하기
SELECT STAFF_NM, DEP_NM
FROM kimsql.clerk
ORDER BY 1;

# 8. CLERK2 테이블에서 부서명을 기준으로 오름차순 정렬한 후, 이름으로 오름차순 정렬하여 이름 및 부서명을 출력해보자
# 8-1. ORDER BY 뒤에 열 이름 사용하기
SELECT STAFF_NM, DEP_NM
FROM kimsql.clerk2
ORDER BY DEP_NM, STAFF_NM;

# 8-2. ORDER BY 뒤에 열 위치 사용하기
SELECT STAFF_NM, DEP_NM
FROM kimsql.clerk2
ORDER BY 2, 1;

# 9. CLERK 테이블에서 재직 구분, 성별, 이름, 부서명을 기준으로 오름차순 정렬하고 재직구분, 성별, 이름, 부서명을 출력해보자
# 9-1. ORDER BY 뒤에 열 이름 사용하기
SELECT EMP_FLAG, GENDER, STAFF_NM, DEP_NM
FROM kimsql.clerk
ORDER BY EMP_FLAG, GENDER, STAFF_NM, DEP_NM;

# 9-2. ORDER BY 뒤에 열 위치 사용하기
SELECT EMP_FLAG, GENDER, STAFF_NM, DEP_NM
FROM kimsql.clerk
ORDER BY 1, 2, 3, 4;

# 10. CLERK 테이블에서 생년월일을 기준으로 오름차순 정렬하여 생년월일, 이름, 부서명을 출력해보자
# 10-1. 정렬하려는 열 이름 뒤에 ASC 입력하기
SELECT BIRTH_DT, STAFF_NM, DEP_NM
FROM kimsql.clerk
ORDER BY BIRTH_DT ASC;

# 10-2. 정렬하려는 열 위치 혹은 열 이름만 입력하기
SELECT BIRTH_DT, STAFF_NM, DEP_NM
FROM kimsql.clerk
ORDER BY BIRTH_DT;

SELECT BIRTH_DT, STAFF_NM, DEP_NM
FROM kimsql.clerk
ORDER BY 1;

# 11. CLERK 테이블에서 생년월일을 기준으로 내림차순 정렬하여 생년월일, 이름 및 부서명을 출력해보자
SELECT BIRTH_DT, STAFF_NM, DEP_NM
FROM kimsql.clerk
ORDER BY BIRTH_DT DESC;

# 12. CLERK 테이블에서 재직 여부를 기준으로 내림차순 정렬한 후 성별을 기준으로 오름차순 정렬하여 재직여부, 성별 및 이름을 출력해보자
SELECT EMP_FLAG, GENDER, STAFF_NM
FROM kimsql.clerk
ORDER BY EMP_FLAG DESC, GENDER;

SELECT EMP_FLAG, GENDER, STAFF_NM
FROM kimsql.clerk
ORDER BY EMP_FLAG DESC, GENDER ASC;

# 실습
# PERF 테이블에서 고객 생년월일을 기준으로 오름차순 정렬해서 고객아이디, 고객 생년월일, 방문횟수를 출력
SELECT ﻿CUST_ID, CUST_BIRTH, VISIT_CNT
FROM kimsql.perf
ORDER BY CUST_BIRTH;
# -> 분석 결과 전반적으로 연령이 높을수록 백화점 방문횟수가 많다는 것을 알 수 있음.

# PERF 테이블에서 고객의 백화점 방문횟수별 구입금액의 분포
SELECT ﻿CUST_ID, VISIT_CNT, SALES_AMT
FROM kimsql.perf
ORDER BY VISIT_CNT DESC;
# -> 분석 결과 방문횟수가 높을수록 구입금액 또한 높다는 것을 알 수 있음
# -> 최대한 백화점에 많이 방문하게 하는 마케팅 캠패인이 수익과 직결된다는 통찰력 얻음





