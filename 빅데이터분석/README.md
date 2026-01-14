# 25-2 4학년 2학기

## 1. 수업 목적

- 모델링, ML/DL, AI를 활용해 데이터과학과 데이터분석을 이해하고 미디어 데이터분석을 실습하는 것

<br>

## 2. 프로젝트 주제

- 주제: 미디어 텍스트 마이닝 기반 주가 변동성 원인 분석
- 연구문제
  - 주가 급등 시기에 시장을 지배하는 정보 프레임은 어떻게 변화하는가?
  - 펀더멘털과 무관한 주가 급등은 어떤 감성적 특징과 인과관계를 갖는가?
- 실험방법
  - 데이터 수집 및 전처리
    - Selenium 활용 네이버 금융 뉴스 기사 약 12,000건 수집
    - YouTube API 활용 주요 경제 채널 댓글 약 5,000건 수집
  - 텍스트 마이닝
    - BERTopic 기반 토픽모델링
    - 금융 도메인 특화 언어 모델 기반 뉴스 헤드라인의 긍/부정 감성 지수 산출
  - 가설 검증
    - 급등 이벤트 전후 시장의 주도 토픽과 감성 점수에 유의미한 차이 확인을 위한 Welch's T-test
    - 뉴스의 특정 토픽이 실제 주가 수익률을 선행하는지 시차별 인과관계 분석을 위한 Granger Causality Test

<br>

## 3. 담당 역할

- 연구 설계 및 일정 관리
- NLP 모델링: BERTopic을 활용한 토픽 모델링 및 KR-FinBERT 감성 분석 수행
- 통계 분석: 시계열 데이터(뉴스 빈도-주가) 간의 상관관계 분석 및 그레인저 인과검정 코드 구현
- PPT 제작 및 결과 발표

<br>

## 4. 프로젝트 내용

발표자료: [PPT](https://github.com/eunkk01/Business_Analytics/blob/main/%EB%B9%85%EB%8D%B0%EC%9D%B4%ED%84%B0%EB%B6%84%EC%84%9D/GMSW%EB%AF%B8%EB%94%94%EC%96%B4%EB%B9%85%EB%8D%B0%EC%9D%B4%ED%84%B0%EB%B6%84%EC%84%9D_PPT.pdf)

<br>

<img width="1783" height="997" alt="Image" src="https://github.com/user-attachments/assets/90acc2bf-c50b-4884-a0ba-c88a5e11f4ca" />
<img width="1786" height="999" alt="Image" src="https://github.com/user-attachments/assets/dcf0715f-4f40-4310-9c2c-e2b9b9146ad1" />
<img width="1785" height="1001" alt="Image" src="https://github.com/user-attachments/assets/c5ae3826-539e-4687-a5f7-2728355ccae5" />
<img width="1783" height="999" alt="Image" src="https://github.com/user-attachments/assets/27905356-4186-48f1-b88b-ee249487b471" />
<img width="1783" height="1001" alt="Image" src="https://github.com/user-attachments/assets/238286e9-f9e9-48d4-adbc-9aaa6adeede3" />
<img width="1788" height="997" alt="Image" src="https://github.com/user-attachments/assets/eac9c6e3-8d3c-49cc-9037-002934beaa35" />
<img width="1785" height="999" alt="Image" src="https://github.com/user-attachments/assets/3d409b60-34b2-4ac8-bba3-33ecb1abf3ae" />
<img width="1783" height="997" alt="Image" src="https://github.com/user-attachments/assets/79604c25-cd52-4d70-b321-0660e438258d" />
<img width="1786" height="997" alt="Image" src="https://github.com/user-attachments/assets/3cecfe36-757d-441d-bc80-b90c6416b24b" />


