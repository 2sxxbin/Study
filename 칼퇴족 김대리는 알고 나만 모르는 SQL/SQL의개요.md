# Day01 - SQL의 개요
 *출처: 칼퇴족 김대리는 알고 나만 모르는 SQL (개정판)*

 ## 1. 데이터베이스란?
 * 데이터베이스(Database) 정의
   * = 정리 잘 된 캐비닛
   * 여러 사람에게 공유되어 사용될 목적을 가지고, 구조적인 방식으로 관리되는 데이터의 집합
   * 데이터베이스의 체계적인 관리는 데이터베이스 관리 시스템(DBMS: Database Management System)을 통해 이루어짐

 * 데이터베이스 관리 시스템(DBMS) 특성
   * 실시간 접근성(Real-time-processing)
   * 계속적인 변화(Continuous evolution)
     * 데이터베이스의 상태는 동적임
   * 동시 공용(Concurrent sharing)
   * 내용에 의한 참조(Contents reference)
     * 데이터가 가지고 있는 값에 따라 참조됨

 * Database 용어
   * 테이블
     * 테이블의 이름은 고유해야함
   * 스키마(Schema)
     * 테이블에 데이터가 저장되는 방식 정의
   * 열(Column)
     * 테이블을 구성하는 각각의 정보
     * 데이터의 각 열에는 고유한 데이터 형식이 지정됨
     * 데이터 형식 : 정수 데이터, 문자 데이터, 통화 데이터, 날짜 및 시간 데이터 등
   * 행(Row)
     * 테이블의 행 = 레코드
   * 기본 키(Primary Key)
     * 각 행을 고유하게 하는 열이 존재
     * 기본 키는 테이블 생성 시 반드시 필요
  
 ## 2. SQL이란?
 * SQL 개요
   * Structured Query Language

 * SQL 종류
   * 데이터 정의어(DDL : Data Definition Language)
     * CREATE : 테이블 생성
     * DROP : 테이블 삭제
     * ALTER : 기존 테이블 재정의
  
   * 데이터 조작어(DML : Data Manipulation Language)
     * INSERT : 데이터 삽입/입력
     * DELETE : 데이터 삭제
     * UPDATE : 데이터 수정
     * SELECT : 데이터 검색
  
   * 데이터 제어어(DCL : Data Control Language)
     * GRANT : 테이블에 권한 부여
     * REVOKE : 부여한 권한 취소/회수

 ## 3. SQL의 활용
 * 예시
   * 인터넷으로 상품을 가입하려는 사람들이 어디서 어떻게 이탈되는지에 대한 **funnel 분석**을 실시.
     * **funnel 분석** : 인터넷 화면을 단계적으로 분석한 것/구매 단계별 이탈률, 다음 단계로의 전환 등을 알 수 있음.
   

