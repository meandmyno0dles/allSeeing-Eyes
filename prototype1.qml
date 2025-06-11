import pyautogui
from PyQt5.QtGui import QPainter, QPixmap
from PyQt5.QtQuick import QQuickPaintedItem
from PyQt5.QtQml import QQmlApplicationEngine
from PyQt5.QtWidgets import QApplication
import sys

class Eye(QQuickPaintedItem):
    def __init__(self):
        super().__init__()
        self.setRenderTarget(QQuickPaintedItem.FramebufferObject)
        self.eye_pixmap = QPixmap("eye.png")

    def paint(self, painter: QPainter):
        screen_width, screen_height = pyautogui.size()
        mouse_x, mouse_y = pyautogui.position()
        center_x = self.width() / 2
        center_y = self.height() / 2
        dx = mouse_x - screen_width / 2
        dy = mouse_y - screen_height / 2

        eye_offset_x = dx * 0.02  # scale factor
        eye_offset_y = dy * 0.02

        x = center_x - self.eye_pixmap.width() / 2 + eye_offset_x
        y = center_y - self.eye_pixmap.height() / 2 + eye_offset_y

        painter.drawPixmap(x, y, self.eye_pixmap)

if __name__ == '__main__':
    app = QApplication(sys.argv)
    engine = QQmlApplicationEngine()
    engine.load("main.qml")

    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())
