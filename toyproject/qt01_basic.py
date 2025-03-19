## PyQt5 첫 앱개발
import sys 
from PyQt5.QtWidgets import *

#PyQt의 모든 컨트롤은 Widget(위젯)이라고 부름 
class DevWindow(QMainWindow) : #클래스 선언 
    def __init__(self):     #클래스 초기화 스페셜메서드 
        super().__init__()    #부모클래스 QMainWindow도 초기화 

        self.setWindowTitle("My First App ") #윈도우 타이틀 지정 
        self.setGeometry(300,200,600,350) #윈도우 위치(x,y), 크기(w,h) 지정  

app = QApplication(sys.argv) #애플리케이션 인스턴스 생성
win = DevWindow()   #PyQt로 만들어진 클래스 인스턴스 생성 
win.show() #윈도우 바탕화면에 띄워라! 
app.exec_() #애플리케이션이 X버튼을 눌러서 종료되기전까지 실행하라 
