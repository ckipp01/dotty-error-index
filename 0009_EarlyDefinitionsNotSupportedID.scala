import java.io.File

@main def EarlyDefinitionsNotSupportedID =
  trait ListFiles:
    val f: File
    def getList(msg: String) = f.listFiles
  end ListFiles

  class A extends {
    val f = new File("iDontExist")
  } with ListFiles
