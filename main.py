# main.py
import sys
import pyautogui
from PyQt5.QtCore import QObject, QTimer, pyqtSignal, QUrl
from PyQt5.QtGui import QGuiApplication
from PyQt5.QtQml import QQmlApplicationEngine

class CursorTracker(QObject):
    positionChanged = pyqtSignal(int, int)

    def __init__(self):
        super().__init__()
        self.timer = QTimer()
        self.timer.timeout.connect(self.emit_position)
        self.timer.start(30)  # ~33fps

    def emit_position(self):
        x, y = pyautogui.position()
        self.positionChanged.emit(x, y)

if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    tracker = CursorTracker()
    engine.rootContext().setContextProperty("cursorTracker", tracker)

    engine.load(QUrl("main.qml"))
    if not engine.rootObjects():
        sys.exit(-1)

    sys.exit(app.exec_())
