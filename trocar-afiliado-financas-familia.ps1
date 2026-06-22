$replacements = @(
    @{
        File = "src\content\blog\como-fazer-orcamento-familiar.md"
        Old = @'
affiliate_cta:
  title: "Quer uma planilha de orçamento familiar pronta pra usar?"
  description: "Planilha simples e completa pra organizar receitas, gastos fixos e variáveis da sua família, sem precisar saber fórmulas complicadas."
  buttonText: "Quero minha planilha gratuita"
  url: "https://www.vidafinanceirabr.com.br/"
'@
        New = @'
affiliate_cta:
  title: "Quer entender finanças de um jeito simples e visual?"
  description: "O Manual do Dinheiro, da Dinheiro Falante, é um guia ilustrado que explica orçamento, investimentos e organização financeira sem complicação. Ideal pra quem está começando."
  buttonText: "Conhecer o Manual do Dinheiro"
  url: "https://cakto.app/AQVQPJY/?affiliate=qbWLFHdj"
'@
    },
    @{
        File = "src\content\blog\como-organizar-financas-do-casal.md"
        Old = @'
affiliate_cta:
  title: "Quer organizar as finanças do casal de um jeito simples?"
  description: "Curso prático de educação financeira pensado pra casais que querem parar de brigar por dinheiro e construir um planejamento juntos."
  buttonText: "Conhecer o curso"
  url: "https://www.vidafinanceirabr.com.br/"
'@
        New = @'
affiliate_cta:
  title: "Quer entender finanças junto com seu parceiro, de um jeito simples?"
  description: "O Manual do Dinheiro, da Dinheiro Falante, explica de forma ilustrada e didática como organizar dinheiro, investir e planejar o futuro. Ótimo pra estudar a dois."
  buttonText: "Conhecer o Manual do Dinheiro"
  url: "https://cakto.app/AQVQPJY/?affiliate=qbWLFHdj"
'@
    },
    @{
        File = "src\content\blog\reserva-de-emergencia-para-familia.md"
        Old = @'
affiliate_cta:
  title: "Quer aprender a montar sua reserva de emergência do zero?"
  description: "Curso de educação financeira com passo a passo prático pra calcular, guardar e investir sua reserva sem complicação."
  buttonText: "Conhecer o curso"
  url: "https://www.vidafinanceirabr.com.br/"
'@
        New = @'
affiliate_cta:
  title: "Quer entender onde investir sua reserva de emergência?"
  description: "O Manual do Dinheiro, da Dinheiro Falante, traz de forma ilustrada os fundamentos de investimentos e organização financeira, sem complicação técnica."
  buttonText: "Conhecer o Manual do Dinheiro"
  url: "https://cakto.app/AQVQPJY/?affiliate=qbWLFHdj"
'@
    },
    @{
        File = "src\content\blog\conta-conjunta-ou-separada.md"
        Old = @'
affiliate_cta:
  title: "Quer um guia pra decidir junto com seu parceiro?"
  description: "Curso de planejamento financeiro pra casais, com modelos prontos de divisão de contas e organização financeira a dois."
  buttonText: "Conhecer o curso"
  url: "https://www.vidafinanceirabr.com.br/"
'@
        New = @'
affiliate_cta:
  title: "Quer aprender mais sobre organização financeira do casal?"
  description: "O Manual do Dinheiro, da Dinheiro Falante, é um guia ilustrado e didático sobre finanças e investimentos, ótimo pra quem está estruturando a vida financeira a dois."
  buttonText: "Conhecer o Manual do Dinheiro"
  url: "https://cakto.app/AQVQPJY/?affiliate=qbWLFHdj"
'@
    },
    @{
        File = "src\content\blog\como-ensinar-educacao-financeira-para-filhos.md"
        Old = @'
affiliate_cta:
  title: "Quer um guia prático de educação financeira pra ensinar seus filhos?"
  description: "Material com atividades e dicas por idade pra ensinar seus filhos a lidar com dinheiro desde pequenos."
  buttonText: "Conhecer o material"
  url: "https://www.vidafinanceirabr.com.br/"
'@
        New = @'
affiliate_cta:
  title: "Quer aprender junto com seus filhos sobre dinheiro?"
  description: "O Manual do Dinheiro, da Dinheiro Falante, usa ilustrações pra explicar finanças de um jeito simples, ótimo pra estudar em família e ensinar pelo exemplo."
  buttonText: "Conhecer o Manual do Dinheiro"
  url: "https://cakto.app/AQVQPJY/?affiliate=qbWLFHdj"
'@
    }
)

foreach ($item in $replacements) {
    $content = Get-Content -Path $item.File -Raw -Encoding UTF8
    $newContent = $content.Replace($item.Old, $item.New)
    if ($newContent -eq $content) {
        Write-Host "AVISO: nenhuma alteracao em $($item.File)" -ForegroundColor Yellow
    } else {
        Set-Content -Path $item.File -Value $newContent -Encoding UTF8 -NoNewline
        Write-Host "Atualizado: $($item.File)" -ForegroundColor Green
    }
}
