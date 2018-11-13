import nimqml, strutils, unicode

QtObject:
  type WindowHandler* = ref object of QObject
    app*: QApplication
    engine*: QQmlApplicationEngine
  
  proc delete*(self: WindowHandler) =
    self.QObject.delete

proc newWindowHandler*[T](app: QApplication, engine: QQmlApplicationEngine): T =
  new(result)
  result.app = app
  result.engine = engine
  result.QObject.setup

proc loadWindow*[T](wndHandler: T, windowName: string, qmlName: string = nil): T {.discardable.} =
  let qWh = newQVariant(wndHandler)
  defer: qWh.delete
  
  wndHandler.engine.setRootContextProperty(windowName, qWh)
  
  let qUrl = newQUrl("qrc:///" & (if isNilOrEmpty(qmlName): (title(windowName) & ".qml") else: qmlName));
  defer: qUrl.delete
  wndHandler.engine.load(qUrl)