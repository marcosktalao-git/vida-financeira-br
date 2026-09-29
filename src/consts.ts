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
	{ name: 'INSS e Benefícios', slug: 'inss-e-beneficios', tags: ['INSS', 'Aposentadoria', 'Benefícios Sociais'] },
	{ name: 'MEI', slug: 'mei', tags: ['MEI'] },
	{ name: 'Finanças da Família e Crédito', slug: 'financas-e-credito', tags: ['Finanças Familiares', 'Empréstimos'] },
	{ name: 'Bancos e Cartões', slug: 'bancos-e-cartoes', tags: ['Bancos Digitais', 'Cartões'] },
] as const;

export function tagToSlug(tag: string): string {
	return tag
			.toLowerCase()
			.normalize('NFD')
			.replace(/[\u0300-\u036f]/g, '')
			.replace(/\s+/g, '-');
}
export function postInCategory(postTags: string[], category: { tags: readonly string[] }): boolean {
	const wanted = category.tags.map(tagToSlug);
	return postTags.some((t) => wanted.includes(tagToSlug(t)));
}

