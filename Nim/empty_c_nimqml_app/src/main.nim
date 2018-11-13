import nimqml, os, ospaths
import windowHandler, mainWindow

proc loadResources(app: var QApplication) =
  for resfile in walkFiles(joinPath(app.applicationDirPath, "*.rcc")):
    QResource.registerResource(resfile)

proc mainProc() =
  var app = newQApplication()
  defer: app.delete()
  
  var engine = newQQmlApplicationEngine()
  defer: engine.delete()
  
  loadResources(app)
  loadMainWindow(app, engine)
  
  app.exec()

when isMainModule:
  mainProc()
  GC_fullcollect()