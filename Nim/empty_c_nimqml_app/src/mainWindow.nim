import nimqml, windowHandler

QtObject:
  type MainWindowHandler* = ref object of WindowHandler

proc loadMainWindow*(app: QApplication, engine: QQmlApplicationEngine) =
  var mwh = newWindowHandler[MainWindowHandler](app, engine)
  loadWindow(mwh, "mainWindow")