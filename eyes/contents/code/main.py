import sys
import pyautogui
from PyQt6.QtCore import QTimer, QObject, pyqtSignal
from PyQt6.QtGui import QGuiApplication
from PyQt6.QtQml import QQmlApplicationEngine

class CursorTracker(QObject):
    positionChanged = pyqtSignal(int, int)

    def __init__(self, interval_ms=40):
        super().__init__()
        self.timer = QTimer(self)
        self.timer.timeout.connect(self.emit_position)
        self.timer.start(interval_ms)

    def emit_position(self):
        x, y = pyautogui.position()
        self.positionChanged.emit(x, y)

if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()

    tracker = CursorTracker()
    engine.rootContext().setContextProperty("cursorTracker", tracker)

    engine.load("contents/ui/main.qml")

    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec())
