object FDmConexao: TFDmConexao
  OnCreate = DataModuleCreate
  Height = 214
  Width = 438
  PixelsPerInch = 120
  object FDConFB: TFDConnection
    Params.Strings = (
      'User_Name=sysdba'
      'Password=masterkey'
      'Database=C:\Git\Cadastro\base\MINHA_BASE.FDB'
      'DriverID=FB')
    Left = 168
    Top = 80
  end
  object FDConSLite: TFDConnection
    Params.Strings = (
      'Database=C:\Git\Cadastro\base\sqllite'
      'DriverID=SQLite')
    Left = 272
    Top = 88
  end
end
