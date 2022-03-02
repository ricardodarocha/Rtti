object frmRttiExtrator1: TfrmRttiExtrator1
  Left = 0
  Top = 0
  Caption = 'Demo 1'
  ClientHeight = 347
  ClientWidth = 819
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    819
    347)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 325
    Height = 13
    Caption = 
      'Describes TOrderModel, extracts its fields and simulate data bin' +
      'ding'
  end
  object Memo1: TMemo
    Left = 16
    Top = 40
    Width = 337
    Height = 299
    Anchors = [akLeft, akTop, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Consolas'
    Font.Style = []
    Lines.Strings = (
      '<fields>')
    ParentFont = False
    TabOrder = 0
    ExplicitHeight = 252
  end
  object Button1: TButton
    Left = 725
    Top = 38
    Width = 86
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Describe'
    TabOrder = 1
    OnClick = Button1Click
    ExplicitLeft = 580
  end
  object Button2: TButton
    Left = 725
    Top = 100
    Width = 86
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Map'
    TabOrder = 2
    OnClick = Button2Click
    ExplicitLeft = 726
  end
  object bRead: TButton
    Left = 725
    Top = 69
    Width = 86
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Read'
    TabOrder = 3
    OnClick = BtnRead
    ExplicitLeft = 726
  end
  object ValueListEditor1: TValueListEditor
    Left = 359
    Top = 40
    Width = 360
    Height = 192
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 4
    ColWidths = (
      150
      204)
  end
  object Button3: TButton
    Left = 725
    Top = 131
    Width = 86
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Iterar'
    TabOrder = 5
    OnClick = Button3Click
  end
  object ComboBox1: TComboBox
    Left = 359
    Top = 238
    Width = 145
    Height = 21
    Anchors = [akLeft, akBottom]
    TabOrder = 6
    Text = 'ComboBox1'
  end
end
