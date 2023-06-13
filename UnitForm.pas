unit UnitForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TFormPrincipal = class(TForm)
    lblProdutos: TLabel;
    dbgProdutos: TDBGrid;
    dbnvgrProdutos: TDBNavigator;
    edtProdutoId: TEdit;
    lblProdutoId: TLabel;
    lblNome: TLabel;
    edtProdutoNome: TEdit;
    lblSimiliar_id: TLabel;
    edtProdutoSimilar_Id: TEdit;
    btnIncluir: TButton;
    lblSimilar: TLabel;
    dbnvgrSimilar: TDBNavigator;
    dbgSimilar: TDBGrid;
    edtIdSimilar: TEdit;
    edtNomeSimilar: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    btnIncluirSimilar: TButton;
    bvlSepardor: TBevel;
    lblProdutosSimilares: TLabel;
    dbgProdutosSimilares: TDBGrid;
    Bevel1: TBevel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnIncluirSimilarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

uses
  Udm;

{$R *.dfm}

procedure TFormPrincipal.btnIncluirClick(Sender: TObject);
begin
  dm.cdsProdtuos.Insert;
  dm.cdsProdtuosid.AsString := edtProdutoId.Text;
  dm.cdsProdtuosNome.AsString := edtProdutoNome.Text;
  dm.cdsProdtuossimilar_id.AsString := edtProdutoSimilar_Id.Text;
  dm.cdsProdtuos.Post;
end;

procedure TFormPrincipal.btnIncluirSimilarClick(Sender: TObject);
begin
  dm.cdsSimilar.Insert;
  dm.cdsSimilarid_similar.AsString := edtIdSimilar.Text;
  dm.cdsSimilarNome_Similar.AsString := edtNomeSimilar.Text;
  dm.cdsSimilar.Post;
end;

procedure TFormPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dm.cdsProdtuos.SaveToFile(ExtractFileDir(Application.ExeName)+ '\cdsProdutos.xml');
  dm.cdsProdtuos.Close;

  dm.cdsSimilar.SaveToFile(ExtractFileDir(Application.ExeName)+ '\cdsSimilar.xml');
  dm.cdsSimilar.Close;

  dm.cdsProdutoSimilar.Close;
  dm.cdsProdutoSimilar.MasterSource := NIL;
  dm.cdsProdutoSimilar.IndexFieldNames := '';
  dm.cdsProdutoSimilar.MasterFields := '';

end;

procedure TFormPrincipal.FormCreate(Sender: TObject);
begin

  try
    dm.cdsProdtuos.CreateDataSet;
    dm.cdsProdtuos.Open;
    if FileExists(ExtractFileDir(Application.ExeName)+ '\cdsProdutos.xml') then
      dm.cdsProdtuos.LoadFromFile(ExtractFileDir(Application.ExeName)+ '\cdsProdutos.xml');

  except on E: Exception do
    ShowMessage(E.Message + ' erro ao tentar abrir cdsProdutos');
  end;

  try
    dm.cdsSimilar.CreateDataSet;
    dm.cdsSimilar.Open;
    if FileExists(ExtractFileDir(Application.ExeName)+ '\cdsSimilar.xml') then
      dm.cdsSimilar.LoadFromFile(ExtractFileDir(Application.ExeName)+ '\cdsSimilar.xml');

  except on E: Exception do
    ShowMessage(E.Message + ' erro ao tentar abrir cdsSimilar');
  end;

  try
    dm.cdsProdutoSimilar.CreateDataSet;
    dm.cdsProdutoSimilar.Open;
    if FileExists(ExtractFileDir(Application.ExeName)+ '\cdsProdutos.xml') then
      dm.cdsProdutoSimilar.LoadFromFile(ExtractFileDir(Application.ExeName)+ '\cdsProdutos.xml');

  except on E: Exception do
    ShowMessage(E.Message + ' erro ao tentar abrir cdsProdutoSimilar');
  end;

  dm.cdsProdutoSimilar.MasterSource := dm.dsSimilar;
  dm.cdsProdutoSimilar.IndexFieldNames := 'SIMILAR_ID';
  dm.cdsProdutoSimilar.MasterFields := 'ID_SIMILAR';

end;

end.
