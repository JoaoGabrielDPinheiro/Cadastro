object FDmConexao: TFDmConexao
  OnCreate = DataModuleCreate
  Height = 214
  Width = 438
  PixelsPerInch = 120
  object FDConFB: TFDConnection
    Params.Strings = (
      'DriverID=FB'
      'User_Name=sysdba'
      'Password=masterkey'
      'Database=C:\Git\Cadastro\base\MINHA_BASE.FDB')
    Connected = True
    Left = 168
    Top = 80
  end
  object FDConSLite: TFDConnection
    Params.Strings = (
      'DriverID=SQLite'
      'Database=C:\Git\Cadastro\base\base_sqllite')
    Connected = True
    Left = 272
    Top = 88
  end
end
