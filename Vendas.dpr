program Vendas;

uses
  Vcl.Forms,
  TelaCliente in 'View\TelaCliente.pas' {frmTelaCliente},
  TelaClienteCadastro in 'View\TelaClienteCadastro.pas' {frmTelaClienteCadastro},
  TelaPrincipal in 'View\TelaPrincipal.pas' {frmTelaPrincipal},
  TelaProduto in 'View\TelaProduto.pas' {frmTelaProduto},
  TelaProdutoCadastro in 'View\TelaProdutoCadastro.pas' {frmTelaProdutoCadastro},
  TelaVenda in 'View\TelaVenda.pas' {frmTelaVenda},
  TelaVendaCadastro in 'View\TelaVendaCadastro.pas' {frmTelaVendaCadastro},
  DataModulePrincipal in 'DataModule\DataModulePrincipal.pas' {dtmPrincipal: TDataModule},
  Modelo.Cliente in 'Model\Modelo.Cliente.pas',
  Modelo.Produto in 'Model\Modelo.Produto.pas',
  Modelo.Venda in 'Model\Modelo.Venda.pas',
  Repositorio.Cliente in 'Repository\Repositorio.Cliente.pas',
  Repositorio in 'Repository\Repositorio.pas',
  Repositorio.Produto in 'Repository\Repositorio.Produto.pas',
  Repositorio.Venda in 'Repository\Repositorio.Venda.pas',
  ServicePessoaAPI in 'Service\ServicePessoaAPI.pas',
  ControllerCliente in 'Controller\ControllerCliente.pas',
  Vcl.Themes,
  Vcl.Styles,
  TelaRelatorio in 'View\TelaRelatorio.pas' {frmTelaRelatorio};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Emerald Light Slate');
  Application.CreateForm(TdtmPrincipal, dtmPrincipal);
  Application.CreateForm(TfrmTelaPrincipal, frmTelaPrincipal);
  Application.CreateForm(TfrmTelaRelatorio, frmTelaRelatorio);
  Application.Run;
end.
