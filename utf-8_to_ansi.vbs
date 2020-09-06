Option Explicit

Private Const adReadAll = -1
Private Const adSaveCreateOverWrite = 2
Private Const adTypeBinary = 1
Private Const adTypeText = 2
Private Const adWriteChar = 0

Private Sub UTF8toANSI(ByVal UTF8FName, ByVal ANSIFName)
     Dim strText

     With CreateObject("ADODB.Stream")
       .Open
       .Type = adTypeBinary
       .LoadFromFile UTF8FName
       .Type = adTypeText
       .Charset = "utf-8"
       strText = .ReadText(adReadAll)
       .Position = 0
       .SetEOS
       .Charset = "iso-8859-1"
       .WriteText strText, adWriteChar
       .SaveToFile ANSIFName, adSaveCreateOverWrite
       .Close
     End With
End Sub

UTF8toANSI WScript.Arguments(0), WScript.Arguments(1)