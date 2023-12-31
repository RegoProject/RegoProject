# RegoProject
- Zero-shot detection을 활용한 식재료 관리 및 레시피 추천 서비스

## 01. 프로젝트 소개
- 식재료가 활용되지 못하고 버려지는 경우가 많고, 한정된 레시피나 익숙한 요리가 반복됨
- zero-shot detection 모델을 이용한 식품 인식 기능을 이용해, 편리한 식재료 관리 기능 제공
- 사용자의 보유 식재료 기반 맞춤형 레시피 추천 기능으로 편리하고 다양한 식사 준비를 할 수 있게 도와줌
- 낭비되는 식재료가 줄어, 음식물 쓰레기가 감소하고, 사용자에게 다양한 레시피를 추천하여 사용자에게 다양한 레시피를 접할 수 있게 도와줄 것으로 기대

## 02. 프로젝트 특장점
- zero-shot detection을 활용하여, 식재료를 손쉽게 등록할 수 있는 서비스 제공
- 손쉬운 식재료 관리 페이지 제공
- 사용자 보유 재료 기반으로 레시피 추천 서비스 제공
- 요리 완성 사진을 제출하여 성공 여부 판단하여 리워드 제공
- 본인만의 레시피, 음식 플레이팅 사진 등 사용자와 공유하는 커뮤니티 서비스 제공
  


## 03. 프로젝트 개발내용
### 식재료/요리 인식 및 레시피 추천 API 설계
#### 1. 식재료 인식 API 설계
- Grounding DINO 거대이미지 모델을 가져와 식재료 사진 Object Detection
- 식재료 이미지로 resnet50 전이학습 후 Object Detection 결과를 분류
#### 2. 완성된 요리 인식 API 설계
- 요리 이미지로 resnet50 전이학습
- 사용자의 요리 사진을 입력받은 후 모델이 예측한 결과를 이용해, 요리 성공/실패 구분
#### 3. 보유 식재료 기반 레시피 추천 API 설계
- 사용자의 보유 식재료를 원 핫 인코딩
- 보유 식재료와 레시피의 식재료의 코사인 유사도가 높은 레시피를 추천

### 웹 서비스 구현
#### 1. 서비스 구현
- Spring Boot 기반 웹 서비스 구현
- 비동기 통신을 이용하여 , API 서버와 연결 및 기능 구현
#### 2. AWS EC2를 이용해 웹 서비스 및 API 서버 배포 

## 04. 주요 사용 기술 및 기대효과
### 1. 주요 사용기술
- Front-End : JSP , CSS , JS
- Back-End : Spring Boot, MySQL , AWS EC2 , Flask
- AI : 제료샷 객체 탐지, 컨텐츠 기반 필터링, 이미지 분류
### 2. 기대 효과
- 사용자에게 난이도별 다양한 요리 레시피와 아이디어 제공 및 식사 계획에 도움
- 냉장고에 있는 식재료를 한 눈에 볼 수 있어 유통기한이 짧은 식재료 관리에 도움
- 요리 완성 시 코인 시스템을 도입하여 사용자의 흥미와 관심 유발
- 보유한 식재료를 기반으로 한 레시피 추천으로 인해 불필요한 소비가 없어지며, 음식물 쓰레기 감소
### 3. 활용 방안
- 식품 판매 사이트와 비즈니스화 가능
- 식재료 스캔 기능을 통한 레시피 사이트 , 미디어 플랫폼의 맞춤형 레시피 추천 영상을 제공
- 레시피 성공 시, 제공되는 코인으로 온누리 상품권 등 지역 상품권 연계


## 웹 페이지 구성
# 메인화면
![image](https://github.com/RegoProject/RegoProject/assets/132921827/7490aebb-1ad7-494e-8bae-f8a84e42913a)

# 식재료 리스트 화면
![image](https://github.com/RegoProject/RegoProject/assets/132921827/b9c14984-5c90-4f36-8b99-ceed6f907838)

# 식재료 추가 모달 기능
![image](https://github.com/RegoProject/RegoProject/assets/132921827/53d171c8-e2d3-41b3-8da1-a3285856e14e)
![image](https://github.com/RegoProject/RegoProject/assets/132921827/93434305-fc65-4199-beb2-559e7c7322b4)

# 추천받은 레시피 목록 / 요리 제출 페이지
![image](https://github.com/RegoProject/RegoProject/assets/132921827/c8533667-d5e3-4b66-9458-7d7fc65b4d8e)

# 커뮤니티 기능
![image](https://github.com/RegoProject/RegoProject/assets/132921827/bc3dd6da-f745-4eee-b1b6-19003a42255f)


