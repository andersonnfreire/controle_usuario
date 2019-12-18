unit DAO;

interface

uses
  SysUtils, Classes, DB, DBTables, DBClient, Provider, ImgList, Controls;

type
  Tdm = class(TDataModule)
    dbLogin: TDatabase;
    QUsuario: TQuery;
    PUsuario: TDataSetProvider;
    MUsuario: TClientDataSet;
    QAux: TQuery;
    img: TImageList;
    QInterface: TQuery;
    QInterfaceidInterface: TIntegerField;
    QInterfacenome: TStringField;
    QInterfacelabel: TStringField;
    QUsuarioidUsuario: TIntegerField;
    QUsuarionome: TStringField;
    QUsuariosenha: TStringField;
    QUsuariocorInterface: TStringField;
    QUsuariocorEditDesabilidato: TStringField;
    QUsuariocorEditFundo: TStringField;
    QUsuariocorBarraPrincipal: TStringField;
    QUsuariocorTelaFundoPrincipal: TStringField;
    PInterface: TDataSetProvider;
    MInterface: TClientDataSet;
    MUsuarioidUsuario: TIntegerField;
    MUsuarionome: TStringField;
    MUsuariosenha: TStringField;
    MUsuariocorInterface: TStringField;
    MUsuariocorEditDesabilidato: TStringField;
    MUsuariocorEditFundo: TStringField;
    MUsuariocorBarraPrincipal: TStringField;
    MUsuariocorTelaFundoPrincipal: TStringField;
    MInterfaceidInterface: TIntegerField;
    MInterfacenome: TStringField;
    MInterfacelabel: TStringField;
    QInterfaceUsu: TQuery;
    QInterfaceUsuidInterface: TIntegerField;
    QInterfaceUsualterar: TBooleanField;
    QInterfaceUsudeletar: TBooleanField;
    QInterfaceUsuinserir: TBooleanField;
    QInterfaceUsupesquisar: TBooleanField;
    QUsuariologin: TStringField;
    MUsuariologin: TStringField;
    procedure MUsuarioAfterPost(DataSet: TDataSet);
    procedure MUsuarioAfterCancel(DataSet: TDataSet);
    procedure MUsuarioAfterDelete(DataSet: TDataSet);
    procedure MUsuarioAfterInsert(DataSet: TDataSet);
    procedure MInterfaceAfterCancel(DataSet: TDataSet);
    procedure MInterfaceAfterPost(DataSet: TDataSet);
    procedure MInterfaceAfterDelete(DataSet: TDataSet);
    procedure MInterfaceAfterInsert(DataSet: TDataSet);
    procedure MUsuarioBeforeDelete(DataSet: TDataSet);
    procedure QInterfaceUsuPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure MUsuarioAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

{$R *.dfm}

procedure Tdm.MUsuarioAfterPost(DataSet: TDataSet);
begin
   MUsuario.ApplyUpdates(-1);
end;

procedure Tdm.MUsuarioAfterCancel(DataSet: TDataSet);
begin
   MUsuario.CancelUpdates;
end;

procedure Tdm.MUsuarioAfterDelete(DataSet: TDataSet);
begin
   MUsuario.ApplyUpdates(-1);
end;

procedure Tdm.MUsuarioAfterInsert(DataSet: TDataSet);
var cod : integer;
begin
     QAux.SQL.Text := 'select valor from parametro where parametro = :p';
     qaux.ParamByName('p').AsString := 'seqUsuario';
     qaux.Open;
     cod := strtoint(trim(qaux.Fields[0].Asstring))+1;
     MUsuarioidUsuario.AsInteger := cod;

     qaux.SQL.text := 'update parametro set valor = :v where parametro = :p';
     qaux.ParamByName('v').asstring :=  inttostr(cod);
     qaux.ParamByName('p').AsString := 'seqUsuario';
     qaux.ExecSQL;
end;

procedure Tdm.MInterfaceAfterCancel(DataSet: TDataSet);
begin
   MInterface.CancelUpdates;
end;

procedure Tdm.MInterfaceAfterPost(DataSet: TDataSet);
begin
  MInterface.ApplyUpdates(-1);
end;

procedure Tdm.MInterfaceAfterDelete(DataSet: TDataSet);
begin
   MInterface.ApplyUpdates(-1);
end;

procedure Tdm.MInterfaceAfterInsert(DataSet: TDataSet);
var cod : integer;
begin
     QAux.SQL.Text := 'select valor from parametro where parametro = :p';
     qaux.ParamByName('p').AsString := 'seqInterface';
     qaux.Open;
     cod := strtoint(trim(qaux.Fields[0].Asstring))+1;
     MInterfaceidInterface.AsInteger := cod;

     qaux.SQL.text := 'update parametro set valor = :v where parametro = :p';
     qaux.ParamByName('v').asstring :=  inttostr(cod);
     qaux.ParamByName('p').AsString := 'seqInterface';
     qaux.ExecSQL;
end;

procedure Tdm.MUsuarioBeforeDelete(DataSet: TDataSet);
begin
   QAux.close;
   QAux.SQL.Text := 'DELETE FROM Usuario_Interface WHERE idUsuario = :parametro';
   QAux.ParamByName('parametro').asinteger := MUsuarioidUsuario.AsInteger;
   QAux.ExecSQL;
end;

procedure Tdm.QInterfaceUsuPostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
var
  ErroMens :String;
begin
  ErroMens := E.Message;
  if ErroMens = 'Key violation.' then
  begin
    Action := daAbort;
    raise Exception.Create('Este registro já foi cadastrado!');
  end;
end;

procedure Tdm.MUsuarioAfterScroll(DataSet: TDataSet);
begin
   QInterfaceUsu.close;
   QInterfaceUsu.SQL.text := 'select idInterface, alterar,deletar,inserir,pesquisar from Usuario_Interface where idUsuario =:id';
   QInterfaceUsu.ParamByName('id').asinteger := MUsuarioidUsuario.AsInteger;
   QInterfaceUsu.Open;
end;

end.
