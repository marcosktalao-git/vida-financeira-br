# Auditoria de template — bancos “vale a pena”

**Data:** 2026-09-06  
**Agente:** adsense-recovery / eeat-auditor (critério AdSense originalidade)  
**Arquivos:**

- `src/content/blog/nubank-vale-a-pena.md`
- `src/content/blog/inter-vale-a-pena.md`
- `src/content/blog/c6-bank-vale-a-pena.md`

## Veredito

**REPROVADO** no critério de originalidade para AdSense.

Os três artigos compartilham a mesma estrutura e frases quase idênticas, trocando só o nome do banco. Isso caracteriza conteúdo em série / template — exatamente o padrão que o Google associa a “conteúdo de baixo valor”.

## Frases e padrões repetidos

| Padrão | Nubank | Inter | C6 |
|--------|--------|-------|-----|
| Abertura “Você já deve ter ouvido falar do X…” | Sim | Sim | Sim |
| “Mas a pergunta que não quer calar é: será que o X realmente vale a pena? A resposta é: depende.” | Sim (idêntico) | Sim (idêntico) | Sim (idêntico) |
| “Neste artigo, vou mostrar os pontos positivos e negativos de forma honesta, sem rodeios e sem fazer propaganda…” | Sim | Sim | Sim |
| “Se você tem mais de 40 anos, não nasceu em ambiente digital e está cansado de pagar tarifas…” | Sim | Sim | Sim |
| Seções vantagens / desvantagens / para quem vale / FAQ espelhadas | Sim | Sim | Sim |

PicPay (`picpay-vale-a-pena.md`) varia ligeiramente o primeiro parágrafo, mas recai na mesma fórmula “a pergunta que não quer calar / a resposta é: depende / mais de 40 anos”.

## Notas EEAT

- Fontes oficiais (Banco Central, sites dos bancos) pouco ou nada linkadas de forma verificável.
- Experiência narrativa genérica; números sem data de verificação clara.
- Comparativos cross-link entre si reforçam o cluster duplicado em vez de um único guia autoritativo.

## Correção obrigatória

1. Fundir os quatro “vale a pena” + `inter-ou-nubank` em `melhor-conta-digital.md` com seções por perfil (não por marca clonada).  
2. Remover os `.md` duplicados e configurar 301.  
3. Reescrever o pilar com aberturas e critérios únicos — sem a fórmula “ouviu falar / depende / mais de 40 anos”.

## Status pós-onda 1

Implementado conforme `docs/ADSENSE_CLUSTER_MAP.md` (fusões + redirects).
