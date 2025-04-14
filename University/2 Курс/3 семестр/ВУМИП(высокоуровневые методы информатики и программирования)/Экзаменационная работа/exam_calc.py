from PyQt5 import QtCore, QtGui, QtWidgets
from PyQt5.QtWidgets import QMessageBox
import sys


class Ui_MainWindow(object):
    def setupUi(self, MainWindow):
        MainWindow.setObjectName("MainWindow")
        MainWindow.setFixedSize(380, 449)
        self.centralwidget = QtWidgets.QWidget(MainWindow)
        self.centralwidget.setObjectName("centralwidget")
        self.label_result = QtWidgets.QLabel(self.centralwidget)
        self.label_result.setGeometry(QtCore.QRect(0, 0, 380, 50))
        font = QtGui.QFont()
        font.setFamily("Arial")
        font.setPointSize(15)
        self.label_result.setFont(font)
        self.label_result.setStyleSheet("background-color: rgb(128, 128, 128);\n"
"color: rgb(255, 255, 255);")
        self.label_result.setObjectName("label_result")

        self.btn_0 = QtWidgets.QPushButton(self.centralwidget)
        self.btn_0.setGeometry(QtCore.QRect(0, 349, 150, 100))
        font = QtGui.QFont()
        font.setPointSize(12)
        font.setBold(True)
        font.setWeight(75)
        self.btn_0.setFont(font)
        self.btn_0.setStyleSheet("background-color: rgb(245, 245, 220);")
        self.btn_0.setObjectName("btn_0")

        self.btn_equal = QtWidgets.QPushButton(self.centralwidget)
        self.btn_equal.setGeometry(QtCore.QRect(150, 350, 150, 100))
        font = QtGui.QFont()
        font.setPointSize(12)
        font.setBold(True)
        font.setWeight(75)
        self.btn_equal.setFont(font)
        self.btn_equal.setStyleSheet("background-color: rgb(245, 245, 220);\n"
"background-color: rgb(128, 128, 128);")
        self.btn_equal.setObjectName("btn_equal")

        self.btn_7 = QtWidgets.QPushButton(self.centralwidget)
        self.btn_7.setGeometry(QtCore.QRect(0, 50, 100, 100))
        font = QtGui.QFont()
        font.setPointSize(12)
        font.setBold(True)
        font.setWeight(75)
        self.btn_7.setFont(font)
        self.btn_7.setStyleSheet("background-color: rgb(245, 245, 220);")
        self.btn_7.setObjectName("btn_7")

        self.btn_8 = QtWidgets.QPushButton(self.centralwidget)
        self.btn_8.setGeometry(QtCore.QRect(100, 50, 100, 100))
        font = QtGui.QFont()
        font.setPointSize(12)
        font.setBold(True)
        font.setWeight(75)
        self.btn_8.setFont(font)
        self.btn_8.setStyleSheet("background-color: rgb(245, 245, 220);")
        self.btn_8.setObjectName("btn_8")

        self.btn_9 = QtWidgets.QPushButton(self.centralwidget)
        self.btn_9.setGeometry(QtCore.QRect(200, 50, 100, 100))
        font = QtGui.QFont()
        font.setPointSize(12)
        font.setBold(True)
        font.setWeight(75)
        self.btn_9.setFont(font)
        self.btn_9.setStyleSheet("background-color: rgb(245, 245, 220);")
        self.btn_9.setObjectName("btn_9")

        self.btn_4 = QtWidgets.QPushButton(self.centralwidget)
        self.btn_4.setGeometry(QtCore.QRect(0, 150, 100, 100))
        font = QtGui.QFont()
        font.setPointSize(12)
        font.setBold(True)
        font.setWeight(75)
        self.btn_4.setFont(font)
        self.btn_4.setStyleSheet("background-color: rgb(245, 245, 220);")
        self.btn_4.setObjectName("btn_4")

        self.btn_5 = QtWidgets.QPushButton(self.centralwidget)
        self.btn_5.setGeometry(QtCore.QRect(100, 150, 100, 100))
        font = QtGui.QFont()
        font.setPointSize(12)
        font.setBold(True)
        font.setWeight(75)
        self.btn_5.setFont(font)
        self.btn_5.setStyleSheet("background-color: rgb(245, 245, 220);")
        self.btn_5.setObjectName("btn_5")

        self.btn_6 = QtWidgets.QPushButton(self.centralwidget)
        self.btn_6.setGeometry(QtCore.QRect(200, 150, 100, 100))
        font = QtGui.QFont()
        font.setPointSize(12)
        font.setBold(True)
        font.setWeight(75)
        self.btn_6.setFont(font)
        self.btn_6.setStyleSheet("background-color: rgb(245, 245, 220);")
        self.btn_6.setObjectName("btn_6")

        self.btn_1 = QtWidgets.QPushButton(self.centralwidget)
        self.btn_1.setGeometry(QtCore.QRect(0, 250, 100, 100))
        font = QtGui.QFont()
        font.setPointSize(12)
        font.setBold(True)
        font.setWeight(75)
        self.btn_1.setFont(font)
        self.btn_1.setStyleSheet("background-color: rgb(245, 245, 220);")
        self.btn_1.setObjectName("btn_1")

        self.btn_2 = QtWidgets.QPushButton(self.centralwidget)
        self.btn_2.setGeometry(QtCore.QRect(100, 250, 100, 100))
        font = QtGui.QFont()
        font.setPointSize(12)
        font.setBold(True)
        font.setWeight(75)
        self.btn_2.setFont(font)
        self.btn_2.setStyleSheet("background-color: rgb(245, 245, 220);")
        self.btn_2.setObjectName("btn_2")

        self.btn_3 = QtWidgets.QPushButton(self.centralwidget)
        self.btn_3.setGeometry(QtCore.QRect(200, 250, 100, 100))
        font = QtGui.QFont()
        font.setPointSize(12)
        font.setBold(True)
        font.setWeight(75)
        self.btn_3.setFont(font)
        self.btn_3.setStyleSheet("background-color: rgb(245, 245, 220);")
        self.btn_3.setObjectName("btn_3")

        self.btn_addition = QtWidgets.QPushButton(self.centralwidget)
        self.btn_addition.setGeometry(QtCore.QRect(300, 50, 80, 100))
        font = QtGui.QFont()
        font.setPointSize(12)
        font.setBold(True)
        font.setWeight(75)
        self.btn_addition.setFont(font)
        self.btn_addition.setStyleSheet("background-color: rgb(245, 245, 220);")
        self.btn_addition.setObjectName("btn_addition")

        self.btn_substraction = QtWidgets.QPushButton(self.centralwidget)
        self.btn_substraction.setGeometry(QtCore.QRect(300, 150, 80, 100))
        font = QtGui.QFont()
        font.setPointSize(12)
        font.setBold(True)
        font.setWeight(75)
        self.btn_substraction.setFont(font)
        self.btn_substraction.setStyleSheet("background-color: rgb(245, 245, 220);")
        self.btn_substraction.setObjectName("btn_substraction")

        self.btn_multiplication = QtWidgets.QPushButton(self.centralwidget)
        self.btn_multiplication.setGeometry(QtCore.QRect(300, 250, 80, 100))
        font = QtGui.QFont()
        font.setPointSize(12)
        font.setBold(True)
        font.setWeight(75)
        self.btn_multiplication.setFont(font)
        self.btn_multiplication.setStyleSheet("background-color: rgb(245, 245, 220);")
        self.btn_multiplication.setObjectName("btn_multiplication")

        self.btn_main_division = QtWidgets.QPushButton(self.centralwidget)
        self.btn_main_division.setGeometry(QtCore.QRect(300, 349, 80, 100))
        font = QtGui.QFont()
        font.setPointSize(12)
        font.setBold(True)
        font.setWeight(75)
        self.btn_main_division.setFont(font)
        self.btn_main_division.setStyleSheet("background-color: rgb(245, 245, 220);")
        self.btn_main_division.setObjectName("btn_main_division")
        MainWindow.setCentralWidget(self.centralwidget)

        self.btn_reset = QtWidgets.QPushButton(self.centralwidget)
        self.btn_reset.setGeometry(QtCore.QRect(300, 0, 80, 50))
        font = QtGui.QFont()
        font.setPointSize(12)
        font.setBold(True)
        font.setWeight(75)
        self.btn_reset.setFont(font)
        self.btn_reset.setStyleSheet("background-color: rgb(245, 245, 220);")
        self.btn_reset.setObjectName("btn_reset")
        self.btn_reset.setText("Reset")

        self.retranslateUi(MainWindow)
        QtCore.QMetaObject.connectSlotsByName(MainWindow)

        self.add_functions()
        self.is_equal = False

    def retranslateUi(self, MainWindow):
        _translate = QtCore.QCoreApplication.translate
        MainWindow.setWindowTitle(_translate("MainWindow", "Calculator"))
        self.label_result.setText(_translate("MainWindow", "0"))
        self.btn_0.setText(_translate("MainWindow", "0"))
        self.btn_equal.setText(_translate("MainWindow", "="))
        self.btn_7.setText(_translate("MainWindow", "7"))
        self.btn_8.setText(_translate("MainWindow", "8"))
        self.btn_9.setText(_translate("MainWindow", "9"))
        self.btn_4.setText(_translate("MainWindow", "4"))
        self.btn_5.setText(_translate("MainWindow", "5"))
        self.btn_6.setText(_translate("MainWindow", "6"))
        self.btn_1.setText(_translate("MainWindow", "1"))
        self.btn_2.setText(_translate("MainWindow", "2"))
        self.btn_3.setText(_translate("MainWindow", "3"))
        self.btn_addition.setText(_translate("MainWindow", "+"))
        self.btn_substraction.setText(_translate("MainWindow", "-"))
        self.btn_multiplication.setText(_translate("MainWindow", "*"))
        self.btn_main_division.setText(_translate("MainWindow", "/"))

    def add_functions(self):
        self.btn_0.clicked.connect(lambda: self.write_number(self.btn_0.text()))
        self.btn_1.clicked.connect(lambda: self.write_number(self.btn_1.text()))
        self.btn_2.clicked.connect(lambda: self.write_number(self.btn_2.text()))
        self.btn_3.clicked.connect(lambda: self.write_number(self.btn_3.text()))
        self.btn_4.clicked.connect(lambda: self.write_number(self.btn_4.text()))
        self.btn_5.clicked.connect(lambda: self.write_number(self.btn_5.text()))
        self.btn_6.clicked.connect(lambda: self.write_number(self.btn_6.text()))
        self.btn_7.clicked.connect(lambda: self.write_number(self.btn_7.text()))
        self.btn_8.clicked.connect(lambda: self.write_number(self.btn_8.text()))
        self.btn_9.clicked.connect(lambda: self.write_number(self.btn_9.text()))

        self.btn_addition.clicked.connect(lambda: self.write_number(self.btn_addition.text()))
        self.btn_substraction.clicked.connect(lambda: self.write_number(self.btn_substraction.text()))
        self.btn_multiplication.clicked.connect(lambda: self.write_number(self.btn_multiplication.text()))
        self.btn_main_division.clicked.connect(lambda: self.write_number(self.btn_main_division.text()))

        self.btn_equal.clicked.connect(self.results)
        self.btn_reset.clicked.connect(self.reset_calculation)

    def reset_calculation(self):
        self.label_result.setText("0")
        self.is_equal = False

    def write_number(self, number):
        if self.label_result.text() == "0" or self.is_equal:
            self.label_result.setText(number)
            self.is_equal = False
        else:
            self.label_result.setText(self.label_result.text() + number)

    def results(self):
        if not self.is_equal:
            expression = self.label_result.text()
            try:
                result = eval(expression)
                self.label_result.setText(str(result))
                self.is_equal = True
            except ZeroDivisionError:
                self.show_error("Деление на ноль невозможно")
        else:
            self.show_error("Нельзя выполнить данное действие")

    def show_error(self, message):
        error = QMessageBox()
        error.setWindowTitle("Ошибка")
        error.setText(message)
        error.setIcon(QMessageBox.Warning)
        error.setStandardButtons(QMessageBox.Ok)
        ret = error.exec()

        if ret == QMessageBox.Ok:
            self.label_result.setText("0")
            self.is_equal = False


if __name__ == "__main__":
    app = QtWidgets.QApplication(sys.argv)
    MainWindow = QtWidgets.QMainWindow()
    image = QtGui.QIcon("assets/cacl_ico.ico")
    MainWindow.setWindowIcon(image)
    app.setWindowIcon(image)
    ui = Ui_MainWindow()
    ui.setupUi(MainWindow)
    MainWindow.show()
    sys.exit(app.exec())
