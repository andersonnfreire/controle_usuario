program Project1;

uses
  Forms,
  UPrincipal in 'UPrincipal.pas' {FLogin},
  UTelaMenu in 'UTelaMenu.pas' {FTelaMenu},
  DAO in 'DAO.pas' {dm: TDataModule},
  UCliente in 'UCliente.pas' {FCliente},
  UPadrao in 'UPadrao.pas' {FPadrao},
  UUsuario in 'UUsuario.pas' {FUsuario},
  UInterface in 'UInterface.pas' {FInterface};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFLogin, FLogin);
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TFPadrao, FPadrao);
  Application.Run;
end.
