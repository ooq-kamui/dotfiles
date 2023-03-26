
Private Const book_name = "あdcsn-tbl-yn.xlsm"

Private Const sheet_s_row = 3
Private Const sheet_s_col = 1

'Private Const dcsn_tbl_col_max = 16000

' 
' trigger
' 

Private Sub Worksheet_Change(ByVal Target As Range)
  Call log("Worksheet_Change start")
  Call log("ActiveWorkbook.Name:", ActiveWorkbook.Name)

  If ActiveWorkbook.Name <> book_name Then
    Exit Sub
  End If

  If Intersect(Target, Range("A1:J1")) Is Nothing Then
    Exit Sub
  End If
  
  Call main
End Sub

' 
' main
' 

Sub main()
  Call log("main start")
  
  Dim sheet
  Set sheet = ActiveSheet

  Call tbl_clr(sheet, sheet_s_row)

  Dim t_lvl_num() As Integer
  
  Dim st
  st = lvl_num(sheet, t_lvl_num)
  If st <= 1 Then
    Exit Sub
  End If
  
  Call log("t_lvl_num_idx_max", ar_idx_max(t_lvl_num))
  
  'Dim t_dcsn_tbl_col
  't_dcsn_tbl_col = dcsn_tbl_col(t_lvl_num)
  'If t_dcsn_tbl_col > dcsn_tbl_col_max Then
  '  MsgBox "col num: " + t_dcsn_tbl_col + vbCrLf + "max: " + dcsn_tbl_col_max
  '  Exit Sub
  'End If
  
  Call fct__Y_rcrsv(sheet, sheet_s_row, sheet_s_col, t_lvl_num)
End Sub

'Function dcsn_tbl_col(p_lvl_num) As Long
'
'  Dim dcsn_tbl_col_tmp
'  dcsn_tbl_col_tmp = 1
'
'  For idx = 0 To ar_idx_max(p_lvl_num)
'  
'    dcsn_tbl_col_tmp = dcsn_tbl_col_tmp * p_lvl_num(idx)
'  Next idx
'
'  dcsn_tbl_col = dcsn_tbl_col_tmp
'End Function

Function lvl_num(sheet, p_lvl_num As variant) As Long
  Call log("lvl_num start")

  Dim rng_tmp
  rng_tmp = sheet.Range("A1:J1").Value

  Dim p_lvl_num_idx
  p_lvl_num_idx = 0
  
  Dim rng_tmp_idx_max
  rng_tmp_idx_max = ar2_idx_max(rng_tmp)
  
  For rng_tmp_idx = 1 To rng_tmp_idx_max
    'Call log("for rng_tmp_idx:", rng_tmp_idx)
  
    If IsNumeric(rng_tmp(1, rng_tmp_idx)) = True And rng_tmp(1, rng_tmp_idx) <> 0 Then
  
      ReDim Preserve p_lvl_num(p_lvl_num_idx)
      p_lvl_num(p_lvl_num_idx) = rng_tmp(1, rng_tmp_idx)
      'Call log("p_lvl_num(p_lvl_num_idx)", p_lvl_num(p_lvl_num_idx))
  
      p_lvl_num_idx = p_lvl_num_idx + 1
    End If
  Next rng_tmp_idx

  Call log("lvl_num end")
  lvl_num = p_lvl_num_idx
End Function

Sub fct__Y_rcrsv(sheet, s_row, s_col, lvl_num)
  Call log("fct__Y_rcrsv start")

  Dim lvl_num_child_len
  lvl_num_child_len = 0

  Dim lvl_num_child() As Integer

  Dim lvl_num_len
  lvl_num_len = ar_idx_max(lvl_num) + 1
  Call log("lvl_num_len", lvl_num_len)

  If lvl_num_len >= 2 Then

    lvl_num_child_len = lvl_num_len - 1
    Call log("lvl_num_child_len", lvl_num_child_len)

    ReDim lvl_num_child(lvl_num_child_len - 1)

    For i = 1 To ar_idx_max(lvl_num)
    
      lvl_num_child(i - 1) = lvl_num(i)
    Next i
    Call log("lvl_num_child(0)", lvl_num_child(0))
  End If

  Dim child_col
  child_col = 1

  If lvl_num_child_len >= 1 Then
  
    For i = 0 To lvl_num_child_len - 1
  
      child_col = child_col * lvl_num_child(i)
      Call log("i:", i, child_col)
    Next i
  End If
  Call log("child_col", child_col)
  
  Call fct_new__N(sheet, s_row, s_col, lvl_num(0), child_col)
  
  Call fct_new__Y(sheet, s_row, s_col, lvl_num(0), child_col)

  If child_col <= 1 Then
    Exit Sub
  End If

  For i = 0 To lvl_num(0) - 1
    
    Call fct__Y_rcrsv(sheet, s_row + lvl_num(0), s_col + i * child_col, lvl_num_child)
  Next i
  
  Call log("fct__Y_rcrsv end")
End Sub

Sub fct_new__Y(sheet, s_row, s_col, lvl_num, child_col)
  Call log("fct_new__Y start, lvl_num:", lvl_num)
  
  Const Y = "Y"
  
  For i = 0 To lvl_num - 1
  
    Call cel_rng__(sheet, s_row + i, s_col + i * child_col, 1, child_col, Y)
  Next i
End Sub

Sub fct_new__N(sheet, s_row, s_col, row_num, col_num)

  Const N = "N"

  Call cel_rng__(sheet, s_row, s_col, row_num, col_num * row_num, N)
End Sub

Sub cel_rng__(sheet, s_row, s_col, row_num, col_num, val)
  'Call log("cel_rng__ start")
  'Call log(s_row, s_col, row_num, col_num)

  Dim cel_s
  Set cel_s = sheet.Cells(s_row, s_col)
  Dim cel_e
  Set cel_e = sheet.Cells(s_row + row_num - 1, s_col + col_num - 1)
  
  sheet.Range(cel_s, cel_e).Value = val

  'Call log("cel_rng__ end")
End Sub

Sub cel__(sheet, row, col, val)

  sheet.Range(row, col).Value = val
End Sub

Sub tbl_clr(sheet, s_row)
  Call log("tbl_clr start")

  Dim cel_s
  Set cel_s = sheet.Cells(s_row, 1)
  Dim cel_e
  Set cel_e = ActiveCell.SpecialCells(xlLastCell)
  Call log("cel_e")
  Call log(cel_e)
  
  sheet.Range(cel_s, cel_e).clearContents

  Call log("tbl_clr end")
End Sub

' 
' utl
' 

Function ar_idx_max(ar As Variant) As Integer

  ar_idx_max = UBound(ar)
End Function

Function ar2_idx_max(ar As Variant) As Integer

  ar2_idx_max = UBound(ar, 2)
End Function

Function ar_push(ar As Variant, addValue As Variant) As Long

  If IsArray(ar) = False Then
    Exit Function
  End IF

  Dim ar_len As Long
  ar_len = ar_idx_max(ar) + 1
  
  ReDim Preserve ar(ar_len)
  
  Dim i As Long
  
  If IsObject(ar(0)) = True Then
    Set ar(ar_len) = addValue
  Else
    ar(ar_len) = addValue
  End If
  
  ar_push = ar_idx_max(ar)
End Function

Sub log(ParamArray arg() As Variant)

  Dim flg
  flg = False

  If flg = False Then
    Exit Sub
  End If
  
  'Debug.Print(Join(arg, "  "))
End Sub

