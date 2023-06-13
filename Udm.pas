unit Udm;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Datasnap.DBClient;

type
  Tdm = class(TDataModule)
    cdsProdtuos: TClientDataSet;
    dsProdutos: TDataSource;
    cdsProdtuosNome: TStringField;
    cdsProdtuosid: TIntegerField;
    cdsProdtuossimilar_id: TIntegerField;
    dsSimilar: TDataSource;
    cdsSimilar: TClientDataSet;
    cdsSimilarid_similar: TIntegerField;
    cdsSimilarNome_Similar: TStringField;
    dsProdutoSimilar: TDataSource;
    cdsProdutoSimilar: TClientDataSet;
    cdsProdutoSimilarid: TIntegerField;
    cdsProdutoSimilarNome: TStringField;
    cdsProdutoSimilarsimilar_id: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
