program ProdutosSimilares;

uses
  Vcl.Forms,
  UnitForm in 'UnitForm.pas' {FormPrincipal},
  Udm in 'Udm.pas' {dm: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.Run;
end.
