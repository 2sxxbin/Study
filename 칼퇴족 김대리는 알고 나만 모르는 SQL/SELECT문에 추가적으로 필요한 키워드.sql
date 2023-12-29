# 1. EMP 테이블에 어떤 직급들이 포함되어 있는지 확인해보자
SELECT DISTINCT POSITION
FROM kimsql.emp;

# 2. EMP 테이블에서 직급에 따라 어떤 인사고과를 받았는지 확인해보자
SELECT DISTINCT POSITION, GRADE
FROM kimsql.emp;

# 3. EMP 테이블에서 사번을 나타내는 ID를 CLERK_ID로, 인사고과를 나타내는 GRADE를 PERF로 바꿔 새롭게 이름을 부여해보자
# 3-1. AS 사용하기
SELECT ﻿ID AS CLERK_ID, POSITION, PARTY_NM, MANAGER_ID, TEAM_NM, GRADE AS PERF
FROM kimsql.EMP;

# 3-2. 인용부호("") 사용하기
SELECT ﻿ID "CLERK_ID", POSITION, PARTY_NM, MANAGER_ID, TEAM_NM, GRADE "PERF"
FROM kimsql.emp;

# 인용부호("") + AS 사용하기
SELECT ﻿ID "CLERK_ID", POSITION, PARTY_NM, MANAGER_ID, TEAM_NM, GRADE AS PERF
FROM kimsql.emp;

# 실습
# 인사고과 테이블 EMP에서 실제 인사고과를 주시는 분이 누구고, 몇분인지 알아보아라
# 인사고과를 주고 있는 사람수를 CNT라는 별칭을 사용해서 구하라
SELECT * FROM kimsql.emp;

# 1단계 - 인사고과를 주는 사람들 구하기
SELECT DISTINCT MANAGER_ID
FROM kimsql.emp;

# 2단계 - 인사고과를 몇 명이 주고 있는지 구하기
SELECT count(distinct MANAGER_ID)
FROM kimsql.emp;

# 3단계 - 별칭 사용해서 인사고과를 몇 명이 주고 있는지 구하기
SELECT COUNT(DISTINCT MANAGER_ID) AS CNT
FROM kimsql.emp;