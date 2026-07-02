$files = @(
    # Empréstimos (5)
    "src\content\blog\emprestimo-pessoal-vale-a-pena.md",
    "src\content\blog\como-evitar-juros-abusivos.md",
    "src\content\blog\credito-para-negativado.md",
    "src\content\blog\refinanciamento-de-dividas.md",
    "src\content\blog\como-simular-emprestimo-antes-de-contratar.md",

    # Benefícios Sociais (5)
    "src\content\blog\bpc-loas-explicado.md",
    "src\content\blog\auxilio-doenca-inss.md",
    "src\content\blog\pensao-por-morte-inss.md",
    "src\content\blog\beneficios-sociais-disponiveis-2026.md",
    "src\content\blog\como-recorrer-beneficio-negado-inss.md",

    # Cartões (5)
    "src\content\blog\cartao-com-cashback-vale-a-pena.md",
    "src\content\blog\cartao-para-negativado.md",
    "src\content\blog\como-aumentar-limite-cartao.md",
    "src\content\blog\cartao-credito-ou-debito.md",
    "src\content\blog\como-cancelar-cartao-de-credito.md",

    # Bancos Digitais (5)
    "src\content\blog\inter-vale-a-pena.md",
    "src\content\blog\inter-ou-nubank.md",
    "src\content\blog\c6-bank-vale-a-pena.md",
    "src\content\blog\picpay-vale-a-pena.md",
    "src\content\blog\como-migrar-para-banco-digital.md",

    # INSS / Aposentadoria antigos (15, sem contar como-sair-das-dividas que já tem o link real)
    "src\content\blog\como-se-aposentar-pelo-inss-em-2026.md",
    "src\content\blog\como-consultar-seu-cnis.md",
    "src\content\blog\como-calcular-tempo-de-contribuicao-inss.md",
    "src\content\blog\como-corrigir-erros-no-cnis.md",
    "src\content\blog\contribuinte-facultativo-inss.md",
    "src\content\blog\simulador-aposentadoria-inss.md",
    "src\content\blog\como-aumentar-valor-aposentadoria.md",
    "src\content\blog\inss-para-autonomos.md",
    "src\content\blog\como-pagar-inss-por-conta-propria.md",
    "src\content\blog\regras-atuais-inss-2026.md",
    "src\content\blog\bolsa-familia-2026.md",
    "src\content\blog\nubank-vale-a-pena.md",
    "src\content\blog\melhor-conta-digital.md",
    "src\content\blog\melhor-cartao-sem-anuidade.md",
    "src\content\blog\emprestimo-consignado-vale-a-pena.md",

    # MEI antigos (10)
    "src\content\blog\como-abrir-um-mei.md",
    "src\content\blog\vale-a-pena-abrir-um-mei.md",
    "src\content\blog\impostos-do-mei.md",
    "src\content\blog\quanto-custa-um-mei.md",
    "src\content\blog\beneficios-do-mei.md",
    "src\content\blog\aposentadoria-do-mei.md",
    "src\content\blog\salario-maternidade-mei.md",
    "src\content\blog\como-emitir-nota-fiscal-mei.md",
    "src\content\blog\como-encerrar-um-mei.md",
    "src\content\blog\banco-digital-para-mei.md"
)

$old = 'url: "https://www.vidafinanceirabr.com.br/"'
$new = 'url: "https://cakto.app/AQVQPJY/?affiliate=qbWLFHdj"'

$updated = 0
$skipped = 0

foreach ($file in $files) {
    if (-not (Test-Path $file)) {
        Write-Host "NAO ENCONTRADO: $file" -ForegroundColor Red
        continue
    }
    $content = Get-Content -Path $file -Raw -Encoding UTF8
    $newContent = $content.Replace($old, $new)
    if ($newContent -eq $content) {
        Write-Host "AVISO: nenhuma alteracao em $file" -ForegroundColor Yellow
        $skipped++
    } else {
        Set-Content -Path $file -Value $newContent -Encoding UTF8 -NoNewline
        Write-Host "Atualizado: $file" -ForegroundColor Green
        $updated++
    }
}

Write-Host "--- Resumo: $updated atualizados, $skipped sem alteracao ---" -ForegroundColor Cyan
