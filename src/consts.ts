// Place any global data in this file.
// You can import this data from anywhere in your site by using the `import` keyword.

export const SITE_TITLE = 'Vida Financeira BR';
export const SITE_DESCRIPTION =
	'Aprenda sobre INSS, aposentadoria, MEI, cartões, bancos digitais e organização financeira de forma simples e prática.';
export const SITE_AUTHOR = 'Vida Financeira BR';

export const NAV_LINKS = [
	{ href: '/', label: 'Home' },
	{ href: '/blog', label: 'Artigos' },
	{ href: '/about', label: 'Sobre' },
	{ href: '/contato', label: 'Contato' },
] as const;

export const CATEGORIES = [
	{ name: 'INSS', slug: 'inss' },
	{ name: 'Aposentadoria', slug: 'aposentadoria' },
	{ name: 'MEI', slug: 'mei' },
	{ name: 'Finanças da Família', slug: 'financas-familiares' },
	{ name: 'Cartões', slug: 'cartoes' },
	{ name: 'Bancos Digitais', slug: 'bancos-digitais' },
	{ name: 'Empréstimos', slug: 'emprestimos' },
	{ name: 'Benefícios Sociais', slug: 'beneficios-sociais' },
] as const;

export function tagToSlug(tag: string): string {
	return tag
		.toLowerCase()
		.normalize('NFD')
		.replace(/[\u0300-\u036f]/g, '')
		.replace(/\s+/g, '-');
}
