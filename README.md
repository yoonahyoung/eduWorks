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
![image](https://user-images.githubusercontent.com/103404357/194379532-305a4a73-8329-4dfd-85ca-890c3bfeaf4c.png) <br>

***

# :star: 팀 소개 및 주요 기능
![image](https://user-images.githubusercontent.com/103404357/192155698-c3bbcec1-de4d-42ef-bcce-9afc2e874f42.png)



***
# :star: 구현 기능

## :pushpin: 메인페이지
![메인페이지](https://user-images.githubusercontent.com/103404357/194943634-4debdc7d-e155-4e81-b354-7260ff92791c.gif) <br>
- 구현 기능 설명
  - 출퇴근 기록
  - 전사 공지 / 받은 메일함 / 달력 / 부서 게시판 / 전사 주소록 / 추천, 핫게시판 조회 
  
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

### 📌 출퇴근처리 및 조정신청하기
![출퇴근처리1](https://user-images.githubusercontent.com/103404713/196074257-89b6e1ac-232a-4676-844c-21fc8eb20dc6.gif) <br>
![출퇴근처리2](https://user-images.githubusercontent.com/103404713/196074316-47bd6e6f-074a-4bce-aa02-fe59bb45cbb0.gif) <br>

- 구현기능 설명
    - 각사원의 출퇴근시간과 비교해 출퇴근처리
    - 해당날짜 클릭해서 근태조정신청

### 📌 직원 연차조회
![사용자연차확인](https://user-images.githubusercontent.com/103404713/195556598-b56380d1-d0e8-4b18-9aa4-f331245523ab.gif) <br>

- 구현기능 설명
    - 21년기준으로 연단위 select option 자동생성
    - 연차승인내역 및 지급내역 조회
    
### 📌 개인 인사정보 수정
![내인사정보관리](https://user-images.githubusercontent.com/103404713/195560551-d9056736-e800-4974-8b4d-677788b5ebc3.gif) <br>

- 구현기능 설명
    - 자신의 프로필사진변경 및 기본프로필로 변경
    - 주소api를 통한 주소지변경 및 여러항목 

### 📌 직원 조회 및 수정처리(인사과)
![직원조회및관리](https://user-images.githubusercontent.com/103404713/195563936-a37407f5-3606-47a0-a5ca-5b32a4e80828.gif) <br>

- 구현기능 설명
    - 조건검색을통한 직원검색 및 페이징처리
    - 조회목록에서 다수선택
    - 특정항목 클릭시 그 직원의 수정페이지에서 여러정보 수정처리가능(인사정보수정과 동일)

### 📌 직원 등록하기(인사과)
![직원등록하기](https://user-images.githubusercontent.com/103404713/195573737-2ea6d36e-7f7c-4440-9a0d-253211e330a7.gif) <br>

- 구현기능 설명
    - 모든입력칸 기입시(프로필사진 제외) 등록가능
    - 등록하기시 이메일과 전화번호는 정규식을통해 형식확인

### 📌 ojt 일정관리(인사과)
![ojt일정등록](https://user-images.githubusercontent.com/103404713/195578682-23ef9c14-734d-4a89-b0f1-2edc0836d4fa.gif) <br>
![ojt일정취소](https://user-images.githubusercontent.com/103404713/195578723-b8f235fa-ece4-4b16-ab0c-1959145e515f.gif) <br>
![ojt완료](https://user-images.githubusercontent.com/103404713/195578747-ce1d28f4-9156-460c-a79d-c9da60a5e467.gif) <br>

- 구현기능 설명
    - 각 항목별 조건검색
    - 일정등록/취소/완료 처리시 해당직원이 적합한직원인지 조건검사
    - 등록/취소시 메일전송
    - 날짜선택시 메일에 자동기입

### 📌 부서별 근태관리(인사과)
![근태관리(인사과)](https://user-images.githubusercontent.com/103404713/195645393-db7f31f0-4d13-40b5-8d4e-40075495eb7e.gif) <br>
![근태관리근무시간(인사과)](https://user-images.githubusercontent.com/103404713/195645418-6ba39bec-330b-4eb0-8518-9299a80a15f2.gif) <br>

- 구현기능 설명
    - 부서별/직급별/기간별/이름을통해 근태내역 조회
    - 항목클릭시 항목에 맞는 근태세부정보 및 수정가능한 창 띄워짐
    - 이름클릭시 그 직원의 월별 및 주별통계 조회

### 📌 조정신청내역 관리(인사과)
![조정신청관리1(인사과)](https://user-images.githubusercontent.com/103404713/195658385-ea890d7d-e1e5-4cca-b7d1-4262dd81cb58.gif) <br>
![조정신청관리2(인사과)](https://user-images.githubusercontent.com/103404713/195658733-6b4d30d4-e6b0-4efc-8805-53dfbd7fce5d.gif) <br>

- 구현기능 설명
    - 조정신청내역 조건별 조회
    - 항목클릭시 해당 조정신청내역 상세정보 및 파일(있을경우)다운가능
    - 해당내역 근태조정처리후 처리완료/거절 처리
    
### 📌 연차등록 및 관리(인사과)
![연차승인내역1(인사과)](https://user-images.githubusercontent.com/103404713/195662102-de619bbe-a90d-44c1-a4c9-b41d0de7ab80.gif) <br>
![연차승인내역2(인사과)](https://user-images.githubusercontent.com/103404713/195662120-19381206-99fc-4fd3-ab66-813fe0f8848e.gif) <br>

- 구현기능 설명
    - 전자결제 최종승인난내역, 연차지급내역 조회
    - 연차등록시 직원 근태내역에도 적용
    - 연차지급내역 클릭시 직원의 해당연도 연차현황을 조회
    
### 📌 연차지급(인사과)
![연차지급1(인사과)](https://user-images.githubusercontent.com/103404713/195667903-1856f654-1099-4458-add7-4814b857c518.gif) <br>
![연차지급2(인사과)](https://user-images.githubusercontent.com/103404713/195667911-6caca1a8-3817-4fa3-8aa5-1a5bf338a124.gif) <br>
![연차지급3(인사과)](https://user-images.githubusercontent.com/103404713/195669143-e143437c-345b-47bd-8927-f281eaa02cc4.gif) <br>

- 구현기능 설명
    - 연차일괄지급시 조건에 맞는직원조회후 확인을통해 지급
    - 개별직원을 선택해 일수를 선택후 지급/회수처리

</details>

<details><summary><h3>4. 윤아영</h3></summary>

### 📌  게시판(공지, 부서 게시판)
![전사공지 조회](https://user-images.githubusercontent.com/97347193/198914222-5db81f4f-249d-4b47-b7a2-745dde91a7df.gif)
![부서게시판 조회](https://user-images.githubusercontent.com/97347193/198914672-48716a8c-b289-47c2-83ca-a3d5e9f19502.gif)<br>

- 구현 기능 설명
  - 특정 직급 사용자 공지 관리
  - 전체 게시글 및 검색에 따른 페이징 처리
  - 게시판 상세 조회 시 메일발송 기능을 이용하여 게시글 내용 발송 가능 
  - 대표로 부서게시판 진입 시 전체 부서 게시판 조회 가능 / 분류별 조회 가능
  
### ![게시글 작성](https://user-images.githubusercontent.com/97347193/198914240-18df6664-3b88-4f3a-8bce-2241b5e0e7bf.gif)
![게시글 수정/삭제](https://user-images.githubusercontent.com/97347193/198914269-8c2ac5b7-3d4b-4c7c-8550-74dc61b18b6e.gif)<br>

- 구현 기능 설명
  - 게시글 작성 기능
  - 첨부파일 기능
  - 본인이 작성한 게시글에 보이는 버튼으로 수정/삭제 기능<br>

### 📌  댓글(공지, 부서 게시판)
![댓글 조회/등록/수정/삭제](https://user-images.githubusercontent.com/97347193/198919554-e93acd60-8908-427e-a480-5ac1af5808e7.gif)<br>

- 구현 기능 설명
  - 해당 게시글에 달린 댓글/대댓글 조회
  - 댓글/대댓글 작성가능
  - 본인이 작성한 댓글/대댓글 수정/삭제 가능
  - 대댓글이 달린 원댓글 삭제 시 모양 유지를 위해 '삭제된 댓글입니다.' 표시, 대댓글이 없는 원댓글 삭제 시 전문 삭제<br>
  
### 📌   게시판(익명 게시판)
![게시글 등록](https://user-images.githubusercontent.com/97347193/198924342-daee1a05-3470-4578-b453-10b07b007d3e.gif)
![익명 게시판](https://user-images.githubusercontent.com/97347193/198924062-5a17ba40-f470-4384-92b5-df49db06cec6.gif)<br>

- 구현 기능 설명
  - 익명 게시글 등록 기능
  - 익명 게시판 조회 (검색, 페이징처리 위와 동일)
  - 추천 수/댓글 수에 따른 상위 5개 게시판 조회
  - 상세 조회 시 본인 작성글 수정/삭제 기능(위와 동일), 추천하기/추천취소 기능, 게시글 및 댓글/대댓글 신고 기능<br>
  
### 📌   댓글(익명 게시판)
![익명 댓글](https://user-images.githubusercontent.com/97347193/198925716-0e37738d-e982-438c-8281-05c3d0e0de03.gif)<br>

- 구현 기능 설명
  - 댓글 작성 시 해당 게시글에서만 사용 가능한 닉네임제 기능
  - 닉네임 미입력 혹은 중복일 시 알람창
  - 정상 닉네임 등록 시 재입력 및 수정 불가능<br>
  
### 📌   학생 주소록
![학생 주소록 조회/수정](https://user-images.githubusercontent.com/97347193/198926305-702d8cec-7365-4192-a96a-1b978944043c.gif)

- 구현 기능 설명
  - 오래된순/최신순 정렬 및 검색에 따른 페이징 처리 기능
  - 학생 주소록 상세 조회 시 기본 정보와 수강 정보, 상담이 완료된 건의 활동 이력 조회
  - 홍보팀이나 대표일 경우 학생 정보 수정 가능<br>
  
### 📌   수강신청관리 (홍보과)
![수강신청관리](https://user-images.githubusercontent.com/97347193/198927897-c0d4247e-1490-4bed-93c6-f00e08130e93.gif)

- 구현 기능 설명
  - 대기/승인/반려 목록 조회 기능
  - 승인/반려 기능
  - 반려 시 반려 사유 입력 기능<br>

### 📌   신고 관리 (홍보과)
![신고 조회/처리](https://user-images.githubusercontent.com/97347193/198979643-fe006b1d-f9a4-40b0-a5f4-27ded080edaf.gif)
![신고 처리](https://user-images.githubusercontent.com/97347193/198979785-d45cb84e-b85e-4b6c-aa46-65d62c64fcc9.gif)

- 구현 기능 설명
  - 분류별 신고 목록 조회 가능
  - 블라인드 처리가 필요없을 경우 처리완료 버튼으로 신고 처리 여부 변경 기능
  - 신고 상세 조회 시 댓글/대댓글 신고일 경우 해당 댓글/대댓글 표시 기능
  - 신고 처리를 위한 게시글 조회 시 신고 기능 이용 불가
  - 댓글/대댓글 숨김 처리 및 게시글 블라인드 처리/해제 기능
  - 댓글/대댓글 숨김 처리 시 규제된 댓글 출력 기능 <br>

### 📌   알람 
![알람](https://user-images.githubusercontent.com/97347193/198980382-70e30a2e-2ec7-48f5-9363-1e66ae0b4bd4.gif)
![알람 확인/삭제](https://user-images.githubusercontent.com/97347193/198980392-8cd3da7d-aa68-45b6-9546-eb50cb82c8cb.gif)

- 구현 기능 설명
  - 현재 접속 중인 회원이라면 댓글/대댓글 및 신고 처리에 대한 실시간 알람 기능
  - 댓글/대댓글 알람 클릭 시 해당 게시글로 이동
  - 알람 목록의 x버튼을 이용해 알람 삭제 기능
  - 신고 알람일 경우 이미 처리되었기 때문에 게시글 이동 불가 처리 <br>
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

 
