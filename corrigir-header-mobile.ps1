$novoConteudo = @'
---
import { SITE_TITLE, NAV_LINKS, CATEGORIES } from '../consts';
import HeaderLink from './HeaderLink.astro';
---
<header
	class="fixed top-0 right-0 left-0 z-50 border-b border-border-subtle bg-bg/90 backdrop-blur-md"
>
	<nav class="mx-auto flex h-16 max-w-6xl items-center justify-between gap-6 px-4 sm:px-6 lg:px-8">
		<a
			href="/"
			class="font-serif text-lg font-semibold tracking-tight text-fg no-underline transition-colors hover:text-accent sm:text-xl"
		>
			{SITE_TITLE}
		</a>

		<!-- Menu desktop: escondido em telas pequenas -->
		<div class="hidden items-center gap-1 sm:flex sm:gap-2">
			<div class="group relative">
				<button
					type="button"
					class="flex items-center gap-1 rounded-md px-3 py-2 text-sm font-medium text-muted transition-colors hover:text-fg"
					aria-haspopup="true"
				>
					Categorias
					<svg
						class="h-3.5 w-3.5 transition-transform group-hover:rotate-180"
						viewBox="0 0 12 12"
						fill="none"
						aria-hidden="true"
					>
						<path
							d="M2.5 4.5L6 8L9.5 4.5"
							stroke="currentColor"
							stroke-width="1.5"
							stroke-linecap="round"
							stroke-linejoin="round"
						></path>
					</svg>
				</button>
				<div
					class="invisible absolute left-0 top-full grid w-64 grid-cols-1 gap-0.5 rounded-xl border border-border bg-bg-card p-2 opacity-0 shadow-lg transition-all duration-150 group-hover:visible group-hover:opacity-100 group-focus-within:visible group-focus-within:opacity-100"
				>
					{
						CATEGORIES.map(({ name, slug }) => (
							<a
								href={`/categoria/${slug}/`}
								class="rounded-lg px-3 py-2 text-sm font-medium text-muted no-underline transition-colors hover:bg-accent-subtle hover:text-accent"
							>
								{name}
							</a>
						))
					}
				</div>
			</div>
			{
				NAV_LINKS.map(({ href, label }) => (
					<HeaderLink href={href}>{label}</HeaderLink>
				))
			}
		</div>

		<!-- Botao hamburguer: visivel so em telas pequenas -->
		<button
			id="mobile-menu-button"
			type="button"
			class="flex items-center justify-center rounded-md p-2 text-fg sm:hidden"
			aria-label="Abrir menu"
			aria-expanded="false"
			aria-controls="mobile-menu"
		>
			<svg
				id="icon-menu-open"
				class="h-6 w-6"
				viewBox="0 0 24 24"
				fill="none"
				stroke="currentColor"
				stroke-width="2"
				aria-hidden="true"
			>
				<path stroke-linecap="round" stroke-linejoin="round" d="M4 6h16M4 12h16M4 18h16"></path>
			</svg>
			<svg
				id="icon-menu-close"
				class="hidden h-6 w-6"
				viewBox="0 0 24 24"
				fill="none"
				stroke="currentColor"
				stroke-width="2"
				aria-hidden="true"
			>
				<path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12"></path>
			</svg>
		</button>
	</nav>

	<!-- Painel do menu mobile -->
	<div
		id="mobile-menu"
		class="hidden border-b border-border-subtle bg-bg sm:hidden"
	>
		<div class="flex flex-col gap-1 px-4 py-3">
			{
				NAV_LINKS.map(({ href, label }) => (
					<a
						href={href}
						class="rounded-lg px-3 py-2 text-sm font-medium text-fg no-underline transition-colors hover:bg-accent-subtle hover:text-accent"
					>
						{label}
					</a>
				))
			}
			<div class="mt-2 border-t border-border-subtle pt-2">
				<p class="px-3 pb-1 text-xs font-semibold tracking-widest text-muted uppercase">
					Categorias
				</p>
				{
					CATEGORIES.map(({ name, slug }) => (
						<a
							href={`/categoria/${slug}/`}
							class="block rounded-lg px-3 py-2 text-sm font-medium text-muted no-underline transition-colors hover:bg-accent-subtle hover:text-accent"
						>
							{name}
						</a>
					))
				}
			</div>
		</div>
	</div>
</header>

<script>
	const button = document.getElementById('mobile-menu-button');
	const menu = document.getElementById('mobile-menu');
	const iconOpen = document.getElementById('icon-menu-open');
	const iconClose = document.getElementById('icon-menu-close');

	button?.addEventListener('click', () => {
		const isHidden = menu?.classList.contains('hidden');
		menu?.classList.toggle('hidden');
		iconOpen?.classList.toggle('hidden');
		iconClose?.classList.toggle('hidden');
		button.setAttribute('aria-expanded', isHidden ? 'true' : 'false');
	});
</script>
'@

Set-Content -Path "src\components\Header.astro" -Value $novoConteudo -Encoding UTF8 -NoNewline
Write-Host "Header.astro atualizado com menu mobile" -ForegroundColor Green
