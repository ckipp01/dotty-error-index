// START
@main def EarlyDefinitionsNotSupportedID =
  import java.io.File
  trait ListFiles:
    val f: File
    def getList(msg: String) = f.listFiles
  end ListFiles

  class A extends {
    val f = new File("iDontExist")
  } with ListFiles
// END
