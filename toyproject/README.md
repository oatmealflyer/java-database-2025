## 토이프로젝트 
PYTHON GUI - Oracle 연동 프로그램 

### GUI 프레임워크 
    1. tkinter - 파이썬 내장된 GUI 라이브러리 . 중소형 프로그램 사용 . 간단하게 사용가능 .안이쁨 
    2. PyQt / PySide 
        - C/C++에서 사용하는 GUI 프레임워크 Qt를 파이썬에 사용하게 만든 라이브러리.현재 6버전 출시. 유료 
        - PyQt의 사용라이선스 문제로 Pyside 릴리즈 . PyQt에서 PySide변경하는 데 번거로움 존재 
        - tkinter 보다 난이도가 있음
        - 아주 예쁨 QtDesigner툴로 포토샵처럼 GUI를 디자인 가능 
        - Python GUI 중에서 가장 많이 사용 중 
    3. Kivy 
        - OpenGL(게임엔진용 3D 그래픽엔진 ) 으로 구현되는 GUI 프레임워크 
        - 안드로이드나,iOS 등 모바일용으로도 개발 가능 
        - 최신에 나온 기술이라 아직 불안정 
    4. wxPython 
        - Kivy 멀티플랫폼 GUI 프레임워크 
        - 무지 어려움 

### PyQt5 GUI 사용 
- PyQt5 설치 
    - 콘솔 `pip install PyQt5` 

- QtDesigner 설치 
    - [https:](https://build-system.fman.io/qt-designer-download)
    <img src = "../image/db006.png" width="750">
#### PyQt5 개발 
1. PyQt 모듈 사용 윈앱 만들기 
2. 윈도우 기본설정 
3. PyQt 위젯 사용법(레이블,버튼, ...)
4. 시그널(이벤트) 처리 방법 
5. QtDesigner로 화면 디자인, PyQt와 연동 
    <img src = "../image/db007.png" width="750">


- Python 오라클 연동 테스트 
    - 오라클 모듈 
        - oracledb - Oracle 최신버전에 매칭
        - **cx_Oracle** 구버전까지 잘됨 
        - 콘솔에서 `pip install cx Oracle`
        - Visual Studio Installer 실행 
        - [Microsoft C++ Build Tools] 필요
        - 개별 구성 요소 
            - [x] MSVC v1xx - VS 20XX C++ x64/x86 빌드도구 
            - [x] C++ CMake Tools for Window 
            - [x] Windows 10 SDK(10.0 xxxx)
        - 설치 
    - 콘솔에서 `pip install cx_Oracle`
    - 콘솔 오라클 연동 : [python](./)
        - DPI -1047오류 발생 
        - 64-bit Oracle Clien Library가 OS가 설치되지 않았기 때문에 
        - 11g 다운로드 
        - 압축 해제(C:\DEV\Tool\instantclient_11_2),시스템정보 Path 등록
        - 재부팅! 
    - 콘솔 테스트 결과 
        <img src="../image/db008.png">
- QtDesigner로 화면 구성 
    <img src="">
- PyQt로 Oracle 연동 CRUD 구현 
    - 조회 SELECT 구현 
    - 삽입 INSERT 구현 
    - 수정, 삭제 구현 
    - 입력값 검증(Validation check) 로직 
    - DML이 종료된 후 다시 데이터 로드 로직 추가 
    - 데이터 삽입 후 라인에디트에 기존 입력값이 남아있는 것 제거 

-개발 도중 문제 
    - [X] 수정모드에서 추가버튼을 눌러도 새로운 데이터가  
    저장된 데이터를 테이블위젯에서 더블클릭한뒤 수정 않고 추가를 눌러도 새로 데이터 삽입되는 문제 
    - [X] 수정모드에서 추가를 한 뒤 학생번호가 라인에디트 그대로 존재 
- 개발 완료 화면 
    - 아이콘 변경 및 추가 
    <img src= "">
### 데이터베이스 모델링 
- 서점 데이터 모델링 
    - 현실 세계 데이터를 DB 내에 옮기기 위해 DB설계하는 것 
    - 모델링 중요점 
        1. 객체별로 테이블을 분리할 것 
        2. 각 객체별로 어떤 속성을 가지고 있는지.분리. 속성 -> 컬럼 
        3. 어느 객체와 어느 객체가 관련이 있는지 분석 .부모객체와 자식객체의 관련을 정립. 관계 ,PK/FK   
        4. 한 컬럼에 데이터를 한 개의 데이터만 저장되는 지 파악 
        5. 결정자가 없으면 결정자를 어떻게 만들지 파악. -> PK

    - 모델링 순서 
        1. 객체 분리 - 고객정보 , 도서정보,출판사정보, 주문정보 
        2. 속성 분리 - 일반속성 , 결정자(PK) 속성 
        
    -ERD를 사용해서 모델링 
     1. ERD 생성버튼으로 새 ERD 이름작성 후 만들기 
     2. 논리모델링 시작 
        - 엔티티 속성 추가(속성명,타입,NULL 여부)
        - 결정자(PK) 속성 일부 추가 
        - 관계(7가지 아이콘) 연결
        - 필요없는 속성제거, 필요한 속성추가 
    3. 불리모델링 
        - 엔티티의 테이블 입력 
        - 각 속성의 컬럼명 입력
        - DB에 맞게 타입과 크기를 변경(Oracle,MySQL 등 )
    4. 내보내기 
        - DB를 변경 
        - PK 제약 조건 ,FK 제약조건,비식별제약조건 선택해서 
        - SQL 미리보기로 확인
        - SQL 다운로드
        <img src=>
    5.DBeaver 
        - 내보내기한 sql 오픈
        - 스크립트 실행 
        - ER 다이어그램 그리기 
        <img src="">