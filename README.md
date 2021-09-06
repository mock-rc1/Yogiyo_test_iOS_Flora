`본 템플릿은 소프트스퀘어드의 템플릿으로 상업적인 용도의 활용 및  무단배포를 금합니다.`

# 🏕 RisingTest
> 프로젝트 기간 : 21.07.31 ~ 21.08.13  
> 2주간 진행하는 '요기요' 클론 프로젝트

## 🙋🏻‍♀️ TEAM (Developer)
|  이름  |   역할   |   깃허브   |                              
| :----------: | :----------------: | :----------: |
|김수정| iOS Developer | [suzumsz](https://github.com/suzumsz) |
|최형민| Server Developer | - |

## 🕺🏻 기능소개

    1. 뷰(View)
        1) 구매 로직 뷰 
            - 요기요 홈 뷰, 음식점 뷰, 음식점 카테고리 뷰, 주문 뷰, 결제 뷰 구현 
            
        2) 탭 뷰    
            - 찜 뷰, 검색 뷰, 주문내역 뷰, 마이요기요 뷰 구현

        3) 나머지 뷰
            - 위치 뷰, 요기요 안내 뷰, 고객 센터 뷰, 내 정보 수정 뷰, 닉네임 변경 뷰, 소셜 로그인 뷰, 이메일 로그인 뷰, 회원가입 뷰 구현 

    2. 소셜 로그인
        - Kakao, Naver, Facebook 연동 및 구현

    3. API
        1) 로그인 / 회원가입
            - 로그인, 로그아웃, 자동 로그인, 회원가입 API 연동 및 구현

        2) 구매 로직
            - 메인 음식 카테고리, 음식점 정보, 음식 카테고리, 주문 API 연동 및 구현

        3) 사용자 정보
            - 내 정보 수정, 닉네임 변경, 사용자 정보 조회 API 연동 및 구현

## 📄 개발일지
<details>       
<summary> 2021.07.31 토 - 클론 프로젝트 시작 </summary>      
<div markdown="1">  

    1. 기획서 제출 - 100%
    
    2. 구현 완료한 뷰 및 기능
        - 기능 없이 화면 전환 및 소셜로그인, 이메일로 로그인 뷰 구현 ✔️
        - 스토리보드 탭 바로 연결 (홈,찜,검색,주문내역,마이요기요) ✔️
        - 마이요기요 페이지에서 '로그인'버튼 누르면 나오는 소셜로그인 화면 ✔️
        - '이메일로 로그인' 버튼 클릭시 나오는 화면 ✔️

</div>
</details>

<details>       
<summary> 2021.08.01 일 </summary>      
<div markdown="1">  
      
    1. 구현 완료한 뷰 및 기능
        - 소설로그인(카카오) 연결 ✔️
        - 회원가입 뷰 ✔️
        - 마이요기요 탭 뷰 ✔️
        
    2. 개발 도중 발생하는 이슈
        - 어려웠던 점 
            1) 화면전환 
                - dismiss 후 바로 present되는 뷰
                - dismiss는 잘 되는데 바로 present가 되지 않음 
            
            2) 앱의 구조를 파악하여 뷰를 그리는 것
                - tableView가 좋을지 다른게 좋을지 그런 어려움

            3) 서버와의 협업이 처음이라 어느 부분까지 뷰를 구현해야할지에 대한 막막함

            4) password를 넣는 textField 부분에 버튼을 생성한 후 비밀번호가 보이게, 안보이게 하는 부분

            5) 약관 동의 부분의 버튼
        
    3. 해결한 부분
        1) 약관 동의 버튼 해결
            - 태그값을 이용해 하려고 했지만, 버튼 이미지와 색을 바꿔줘야해서 버튼 하나하나당 액션으로 처리함

            💡 코드가 너무 반복되고 길어서 다시 더 생각해보고 수정 예정

    4. 해결 중인 부분
        1) 화면 전환 (dismiss 후 present)
        2) password 부분 보기 & 가리기    

</div>
</details> 

<details>       
<summary> 2021.08.02 월 - 1차 피드백 </summary>      
<div markdown="1">  

    1. 구현 완료한 뷰 및 기능
        - 소셜로그인(네이버, 페이스북) 연결 ✔️
        - 회원가입 화면 재구성 ✔️
        - 마이요기요 탭 화면 재구성 - 구현중

    2. 개발팀장님의 피드백
         1) UI 유사도 80%
         2) 수요일 전까지 로그인, 회원가입 끝내야 함
         3) 어려운 사항 점검 
            - 테이블뷰 안에 컨트롤러 넣는 방법
            - cell 안에서 뷰 변경하는 방법
        4) 템플릿 사용 강조

    3. 개발 도중 발생하는 이슈
        - 어려웠던 점 및 이슈발생
            1) 테이블 뷰로 구성하여 셀 안에 버튼 클릭시, 화면을 띄우기에 어려움이 있었음
            2) appleID오류로 인해 개발 진행에 어려움을 겪음
            3) 소셜 로그인 pod 파일을 연결하면 생기는 시뮬레이터 오류로 인해 어려움을 겪음
        
        - 해결 시도 : 멘토에게 질문 및 구글링 

    4. 해결하지 못한 부분 → 해결
        1) password를 넣는 textField 부분에 비밀번호를 치면 보이게, 안보이게 하는 부분 해결  
            - 변수를 하나 생성하여 클릭시, 미클릭시의 액션을 넣어주어 해결하였음
        2) 회원가입 화면이 테이블뷰라서 셀 안에 버튼이 눌렸을 때 화면을 present하기 어려웠던 부분 해결 
            - 회원가입 화면을 재구성 함으로써 버튼 클릭시, present할 수 있음
        3) dismiss 후 present 되는 화면 전환의 이슈 해결
            - 페이지를 전환하는 부분의 코드에서 스토리보드를 기준으로 화면을 전환하도록 변경하여 해결하였음
</div>
</details>

<details>       
<summary> 2021.08.03 화 </summary>      
<div markdown="1">  

    1. 구현 완료한 뷰 및 기능
        - 마이요기요 탭 재구성 완료 ✔️
        - 회원가입 API 연동 - 구현중

    2. 개발 도중 발생하는 이슈
        - 어려웠던 점 및 이슈발생
            1) 서버분께 회원가입 및 로그인 API를 받아서 진행하였는데, 서버와의 협업과 API 명세서를 받아 작업하는 것이 처음이라서 좀 많이 힘들었음
            2) 테이블 뷰 안에 컨트롤러를 넣어 진행하였는데, 화면 전환 시 뷰를 불러오는 방법을 다르게 해야해서 어려웠음
        
        - 해결 시도 : 멘토에게 질문 및 구글링

    3. 해결하지 못한 부분 → 해결
        1) 테이블 뷰 안에 컨트롤러를 넣어 진행하였는데, 화면 전환 시 다르게 불러와야해서 어려움을 겪음
            - 코드에서 스토리보드를 불러오는 방법이 따로 있다는 것을 알고 그대로 실행해 줌
</div>
</details>

<details>       
<summary> 2021.08.04 수 </summary>      
<div markdown="1"> 

    1. 구현 완료한 뷰 및 기능
        - 회원가입 API 연동 ✔️
        - 홈 뷰 익스프레스까지 구현 ✔️
        - 로그인 API 연동 - 구현중
        - 추가로 받은 회원가입 API 약관동의 버튼 추가 - 구현중

    2. 개발 도중 발생하는 이슈
        - 어려웠던 점 및 이슈발생
            1) 홈 뷰를 짤 때 화면전환이 용이해야 하고, 데이터를 넣는 부분까지 생각해야하는데 처음 하다보니 그런것들이 어려웠음
            2) 체크박스 누르는 로직을 잘 생각해내지 못해 좀 어려웠음 
        
        - 해결 시도 : 구글링 및 멘토에게 질문

    3. 해결한 부분 및 어떻게 해결하였는지
        1) 회원가입 API
            - 구글링과 템플릿을 보며 적용해 구현에 성공하였다.

</div>
</details>

<details>       
<summary> 2021.08.05 목 </summary>      
<div markdown="1"> 

    1. 구현 완료한 뷰 및 기능
        - 로그인 API 연동 ✔️
        - 홈 뷰 '오늘은 요기서 먹어요' 전까지 구현 완료 ✔️
        - 추가로 받은 회원가입 API 약관동의 버튼 연동 ✔️
        - 현재 위치 화면 - 구현중
        - 홈 뷰 '오늘은 요기서 먹어요' 셀 - 구현중

    2. 개발 도중 발생하는 이슈
        - 어려웠던 점 및 이슈발생
            1) 회원가입 API에 약관동의 버튼을 추가로 받았는데, 제가 짜 놓은 체크박스 로직(Bool값)과 서버분이 짜준 값(Int)이 좀 달라서 수정해야했고 그 부분이 잘 안되어 어려움이 있었음
            2) 스토리보드를 나눠 진행하다보니 화면전환의 어려움이 너무 큼
            3) 화면전환이나 작은 기능들이 안되서 그걸 고치다보니 정작 해야하는 뷰를 많이 구현하지 못해 많이 힘들었음
        
        - 해결 시도 : 구글링 및 멘토에게 질문

    3. 해결한 부분 및 어떻게 해결하였는지
        1) 회원가입 약관동의 API 연동
            - 체크박스와 연결된 Bool 값을 딕셔너리로 true : 1, false:0 이렇게 Int형으로 바꿔 구현함

</div>
</details>

<details>       
<summary> 2021.08.06 금 </summary>      
<div markdown="1"> 

    1. 구현 완료한 뷰 및 기능
        - 음식 카테고리 뷰 클릭시 나오는 음식점 뷰 해시태그 부분 빼고 완료 ✔️
        - 음식 카테고리 뷰 클릭시 나오는 음식점 뷰 해시태그 부분 - 구현중
        - 홈 뷰 '오늘은 요기서 먹어요' 셀 - 구현중
        - 현재 위치 뷰 - 구현중
        - 음식점 셀 클릭 시 나오는 뷰 - 구현중

    2. 개발 도중 발생하는 이슈
        - 어려웠던 점 및 이슈발생
            1) 화면전환이 너무나너무나너무나 어려움... - 뷰 다 만들고 해결 예정(시간을 너무 많이 씀)
            2) 상단 탭 바 라이브러리를 사용중인데, 라이브러리가 바로 연결되어 있는 뷰 컨트롤러 화면에는 컬렉션 뷰 구현이 안되는거 같아 어려움이 있었음
            3) 테이블뷰의 섹션 헤더가 잘 되지 않아 그거 고치는데 너무 오랜 시간을 썼음
            4) 음식 카테고리 뷰 클릭시 나오는 음식점 뷰의 해시태그 부분을 어떻게 구현해야할지 잘 모르겠어서 어려움을 겪음
        
        - 해결 시도 : 구글링 및 멘토에게 질문

    3. 해결한 부분 및 어떻게 해결하였는지
        1) 섹션 헤더가 스크롤 시 테이블 뷰와 함께 스크롤 되도록 바꿔줬고, 테이블뷰의 스타일을 그룹으로 할 시, 생기는 underline 문제를 해결함
            - 테이블 뷰의 스타일을 grouped으로 바꿔줌으로써 스크롤시 헤더가 위에 붙는 현상을 해결함
            - AllTableView.separatorColor = UIColor.clear 이 코드를 사용하여 underline을 제거해 줌

</div>
</details>

<details>       
<summary> 2021.08.07 토 </summary>      
<div markdown="1"> 

    1. 구현 완료한 뷰 및 기능
        - 음식 카테고리 뷰 클릭시 나오는 음식점 뷰 구현완료 ✔️
        - 자동로그인 구현완료 ✔️
        - 로그인 시 '마이요기요' 탭 바 셀 변경 환료 ✔️
        - 홈 뷰 '오늘은 요기서 먹어요' 셀 - 구현중
        - 현재 위치 뷰 - 구현중
        - 음식점 셀 클릭 시 나오는 뷰 - 구현중

    2. 개발 도중 발생하는 이슈
        - 어려웠던 점 및 이슈발생
            1) 로그인 및 회원가입 시 사용자의 토큰을 userDefault에 넣어주는 작업을 해본 적이 없어서 어려움을 느낌
            2) 로그인 시 셀을 로그인 전 셀에서 로그인 후의 셀로 변경해야하는 부분이 어려웠음
            3) 해시태그 만드는 부분에서 셀을 다이나믹 셀로 만들어야하는데 어려워서 아직 구현하지 못함
            4) 뷰를 만들 때 스크롤시 뷰가 변화하는 효과들이 너무 많아 어떻게 구현해야할지 감이 잘 오지않아 힘들었음
            5) 상단 탭 바 라이브러리 사용으로 인해 해당 뷰컨에 컬렉션 뷰가 들어가지 않는 오류가 발생
        
        - 해결 시도 : 구글링 및 멘토에게 질문

    3. 해결한 부분 및 어떻게 해결하였는지
        1) 사용자가 로그인이나 회원가입을 할 때 토큰을 userDefault에 넣어주어 해결
        2) 회원가입시 userDefault 값을 넣어주어 자동로그인 구현
        3) 상단 탭 바 라이브러리 사용으로 인해 해당 뷰컨에 컬렉션 뷰가 들어가지 않는 오류가 발생
            - UIView 안에 컨트롤러를 넣음으로써 구현 완료

</div>
</details>

<details>       
<summary> 2021.08.08 일 </summary>      
<div markdown="1"> 

    1. 구현 완료한 뷰 및 기능
        - 홈 뷰 구현 완료 ✔️
        - 내 정보 수정 뷰 구현 완료 ✔️
        - 닉네임 변경 뷰 구현 완료 ✔️
        - 현재 위치 뷰 - 구현중
        - 음식점 뷰 - 구현중

    2. 개발 도중 발생하는 이슈
        - 어려웠던 점 및 이슈발생
            1) 음식점 뷰 구현이 너무나 어려움
                - 뷰가 너무 복잡해서 어려움을 느낌 
        
        - 해결 시도 : 구글링 및 멘토에게 질문

    3. 해결한 부분 및 어떻게 해결하였는지
        1) 사용자 조회 api로 사용자 정보를 불러왔음 

</div>
</details>

<details>       
<summary> 2021.08.09 월 - 2차 피드백 </summary>      
<div markdown="1"> 

    1. 구현 완료한 뷰 및 기능
        - '내 정보' API 연동 ✔️
        - '배달 주소 설정' 뷰 ✔️
        - 닉네임 변경 API - 구현중 
        - 음식점 뷰 - 구현중
        - 음식 선택 뷰 - 구현중

    2. 개발팀장님의 피드백 
        1) 메인 → 구매로직까지 API 무조건 연동
        2) 애니메이션 효과나 디테일은 시간 좀 남을 때 하기
        3) 하루 뷰 3개씩 구현 및 API 연동 3개씩

    3. 개발 도중 발생하는 이슈
        - 어려웠던 점 및 이슈발생
            1) 사용자 정보의 API를 엮을 때 정보를 불러오지 못해서 어려웠음
            2) 뷰가 너무 복잡해서 어려움
        
        - 해결 시도 : 구글링 및 멘토에게 질문

    4. 해결한 부분 및 어떻게 해결하였는지
        1) 사용자 정보 API 해결
            - url을 잘못 가져와 발생한 오류로 url을 제대로 가져와 사용할 수 있었음

</div>
</details>

<details>       
<summary> 2021.08.10 화 </summary>      
<div markdown="1"> 

    1. 구현 완료한 뷰 및 기능
        - '고객만족센터' 뷰 ✔️
        - '요기요안내' 뷰 ✔️
        - 음식 선택 뷰 ✔️
        - 카테고리 API - 구현중
        - 닉네임 변경 API - 구현중 
        - 음식점 뷰 - 구현중
        - 주문내역 뷰 - 구현중

    2. 개발 도중 발생하는 이슈
        - 어려웠던 점 및 이슈발생
            1) 카테고리 API를 가져올 때 imageView에 넣기위해 사진 url을 변경하는 것이 어려웠음
        
        - 해결 시도 : 구글링 및 멘토에게 질문  

</div>
</details>

<details>       
<summary> 2021.08.11 수 </summary>      
<div markdown="1"> 

    1. 구현 완료한 뷰 및 기능
        - 카테고리 API 구현완료 ✔️
        - 주문내역 뷰 구현완료 ✔️
        - 닉네임 변경 API - 구현중 
        - 음식점 뷰 - 구현중
        - 검색 뷰 - 구현중

    2. 개발 도중 발생하는 이슈
        - 어려웠던 점 및 이슈발생
            1) 뷰 구성 중 테이블 뷰로 토글 만드는 것이 어려웠고, 테이블 뷰 섹션 헤더뷰에 탭 바를 넣는 것이 어려웠음
        
        - 해결 시도 : 구글링 및 멘토에게 질문

    3. 해결한 부분 및 어떻게 해결하였는지
        - 뷰 구성 중 테이블 뷰로 토글 만드는 부분
            - 멘토에게 말해 시간을 너무 할당해야 하는 부분은 기능을 단순화 시키고 추가적으로 수정하도록 함

</div>
</details>

<details>       
<summary> 2021.08.12 목 </summary>      
<div markdown="1"> 

    1. 구현 완료한 뷰 및 기능
        - 닉네임 변경 API 구현완료 ✔️
        - 음식점 뷰 구현완료 ✔️
        - 검색 뷰 구현완료 ✔️
        - 카테고리 별 식당조회 API 구현완료 ✔️
        - 가게별 정보조회 API 구현완료 ✔️

    2. 개발 도중 발생하는 이슈
        - 어려웠던 점 및 이슈발생, 아쉬운 점
            1) API를 가져올 때의 로직을 좀 더 생각해볼 수 있는 시간이 있었으면 좋았을 것 같음 
            2) 셀 안에 컨트롤러에 값을 넣어줘야 할 때 해당 셀을 두번 불러오는 오류가 있어 어려움이 있었음
        
        - 해결 시도 : 구글링 및 멘토에게 질문

    3. 해결한 부분 및 어떻게 해결하였는지
        1) 셀 안에 컨트롤러에 값을 넣어줘야 할 때 해당 셀을 두번 불러오는 오류가 있어 어려움이 있었음
            - 컨트롤러를 두번 호출해 생기는 문제로, 컨트롤러를 한번 호출하도록 바꿔주어 해결 완료

</div>
</details>

## 🛠 개발환경
<a href="" target="_blank"><img src="https://img.shields.io/badge/Swift-FA7343?style=flat-square&logo=Swift&logoColor=white"/></a>
<a href="" target="_blank"><img src="https://img.shields.io/badge/CocoaPods-EE3322?style=flat-square&logo=CocoaPods&logoColor=white"/></a>
<a href="" target="_blank"><img src="https://img.shields.io/badge/Postman-FF6C37?style=flat-square&logo=Postman&logoColor=white"/></a>
<a href="" target="_blank"><img src="https://img.shields.io/badge/Slack-4A154B?style=flat-square&logo=Slack&logoColor=white"/></a>

## 📌 참고
- 라이징 테스트 기획서 [PDF 파일](/etc/라이징테스트기획서_요기요A.pdf), [docx 파일](/etc/라이징테스트기획서_요기요A.docx)  
・ docx 파일은 다운로드해야 볼 수 있음