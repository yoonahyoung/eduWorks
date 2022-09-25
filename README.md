# 🏢 PROJECT - EDUWORKS
***
# Contents <br>
1. [개요](#star-개요)  
2. [팀 소개 및 주요 기능](#star-팀-소개-및-주요-기능)
3. [구현 기능](#star-구현-기능)
    - [메인페이지](#pushpin-메인페이지)
    - [구수민](#1-구수민)
    - [김은영](#2-김은영)   
    - [서주원](#3-서주원)   
    - [윤아영](#4-윤아영)   
    - [허성범](#5-허성범)   
3. [Document](#star-document)

***

# :star: 개요
- 프로젝트명 : EDUWORKS <br>

- 보고서 : [관리하조_프로젝트 보고서.pdf](https://github.com/yoonahyoung/eduWorks/files/9641313/_.pdf) <br>

- 기획 의도  <br>
  - 재택근무 증가로 인한 업무 플랫폼 도입 필요성 <br>
  - 사용과 접근이 용이하여 업무의 효율성 증가 <br>
  - 직관적이고 사용자 친화적인 그룹웨어 개발 필요 <br>
  - 협업을 위한 하나의 플랫폼 사이트 제작 <br>

- 개발 환경 <br><br>
![image](https://user-images.githubusercontent.com/103404357/192147194-1bdabc06-698f-417e-8a9f-660d52a39d32.png) <br>

***

# :star: 팀 소개 및 주요 기능
![image](https://user-images.githubusercontent.com/103404357/192155698-c3bbcec1-de4d-42ef-bcce-9afc2e874f42.png)



***
# :star: 구현 기능

## :pushpin: 메인페이지
나중에 메인 페이지로 변경하기!!
 <br>

<details><summary><h3>1. 구수민</h3></summary>

### 📌
### 📌 
### 📌 
### 📌 
</details>

<details><summary><h3>2. 김은영</h3></summary>

### 📌 전사주소록
![전사주소록](https://user-images.githubusercontent.com/103404357/192148420-9f702f7b-5f61-47e9-b950-18fa44d19474.gif) <br>
- 구현 기능 설명
  - 오래된순/최신순 정렬 및 페이징처리
  - 주소록 검색 (이름/부서/직급/전화번호/이메일/메모에서 검색)
### 📌 개인주소록
![개인주소록](https://user-images.githubusercontent.com/103404357/192149858-f95a2c48-6e67-4fbf-86b8-bebeee60bd29.gif) <br>
- 구현 기능 설명
  - 오래된순/최신순 정렬 및 페이징처리
  - 주소록 검색 (이름/부서/직급/전화번호/이메일/메모에서 검색)
  - 주소록 그룹 추가/수정/삭제
  - 그룹별 연락처 추가/수정/삭제
### 📌 메일 작성
![메일작성](https://user-images.githubusercontent.com/103404357/192150424-bd31d504-bccc-442b-b6c5-e9e3becbbdeb.gif)
- 구현 기능 설명
  - 주소록에서 작성하고자하는 메일 주소 선택하여 '받는사람'에 작성
  - 첨부파일 다중 파일 선택/삭제 및 개수 제한 처리
  - 메일 중요여부 체크 (중요체크시 전송날짜 상관없이 상단에 노출)
  - 메일 미리보기
  - 메일 전송 및 취소
### 📌 메일 작성(나에게)
![메일작성(나에게)](https://user-images.githubusercontent.com/103404357/192151152-6614c673-4b07-451b-aa31-0f54842b7114.gif)
- 구현 기능 설명
  - 첨부파일 다중 파일 선택/삭제 및 개수 제한 처리
  - 메일 중요여부 체크 (중요체크시 전송날짜 상관없이 상단에 노출)
  - 메일 미리보기
  - 메일 전송 및 취소
### 📌 메일 목록 조회
![메일 목록](https://user-images.githubusercontent.com/103404357/192152350-8f4bc6a5-8018-4c94-82ae-8bc3c3483738.gif) <br>

- 구현 기능 설명
  - 보낸/받은/휴지통/중요/읽은/안읽은 각 조건에 맞는 메일 조회
  - 첨부파일 여부 확인 (첨부파일 없는 경우 : 아이콘 없음 | 첨부파일 있는 경우 : 🧷)
  - 메일 읽음 여부 확인 (읽은 경우 : 📩  | 안읽은 경우 : ✉️)
  - 메일 답장 (미선택 및 1개 이상 선택시 '1개의 메일을 선택해주세요' 안내 메세지 표시)
  - 메일 삭제
  - 메일 목록 페이지당 전체 메일 개수 및 안읽은 메일 개수 조회
  - 중요 메일 설정시 중요 메일함에서 조회 가능
  - 메일 상세 조회시 읽은 메일함으로 이동
### 📌 메일 삭제
![메일 삭제](https://user-images.githubusercontent.com/103404357/192152728-d79ff8ef-c7dc-4b11-8702-e7fc19432248.gif) <br>

- 구현 기능 설명
  - 메일 선택 삭제
  - '비우기'선택시 전체 삭제
### 📌 메일 태그
![메일 태그](https://user-images.githubusercontent.com/103404357/192153737-a2fa7380-9437-4cd1-bd4a-408944454a63.gif) <br>

- 구현 기능 설명
  - 메일 태그 추가/수정/삭제
  - 선택하지 않은 상태에서 메일 태그 추가시 '태그를 추가할 메일을 선택해주세요' 안내 메세지 표시
  - 메일 선택 후 태그 삽입
  - 선택한 메일 태그함으로 이동 및 해당 태그 메일만 조회
### 📌 메일 상세 조회  
![메일 상세 조회2](https://user-images.githubusercontent.com/103404357/192155469-62492c94-bceb-474e-83fa-9a551fc4f4ca.gif) <br>

- 구현 기능 설명
  - 메일 상세 조회
  - 중요 메일 설정
  - 첨부파일 다운 (첨부파일이 없는 경우 : '첨부파일이 없습니다' 안내 메세지 표시)
  - 태그 추가 설정
  - 메일 답장
  - 메일 삭제
</details>

<details><summary><h3>3. 서주원</h3></summary>

### 📌 
### 📌 
### 📌 
### 📌 
### 📌 
### 📌 
</details>

<details><summary><h3>4. 윤아영</h3></summary>

### 📌 
### 📌 
### 📌 
### 📌 
### 📌 
</details>

<details><summary><h3>5. 허성범</h3></summary>

### 📌 
### 📌 
### 📌 
### 📌 
### 📌 
</details>


***
# :star: Document

## 개발 일정 <br><br>
![image](https://user-images.githubusercontent.com/103404357/192147566-f71dfaa7-e9fb-4769-a4bb-6949e0477551.png) <br>


## 유스케이스 <br><br>
![image](https://user-images.githubusercontent.com/103404357/192147596-51b35781-2924-4283-9af0-71c210189955.png) <br>
![image](https://user-images.githubusercontent.com/103404357/192147269-a4c47f8a-b30f-49b9-a09f-34f436374036.png) <br>
![image](https://user-images.githubusercontent.com/103404357/192147280-b1c9b5ee-8ac8-4f0f-80f7-502131e33dd5.png) <br>

## DB 설계 <br><br>
![image](https://user-images.githubusercontent.com/103404357/192155679-bf400093-e486-4748-88b0-d4843031e5cc.png) <br>

 
