import type { ImageMetadata } from 'astro';
import { SITE_AUTHOR, SITE_TITLE } from '../consts';

export type SeoType = 'website' | 'article';

export interface BreadcrumbItem {
	name: string;
	path: string;
}

export interface ArticleSeoData {
	pubDate: Date;
	updatedDate?: Date;
}

export function absoluteUrl(path: string, site: URL | string | undefined): string {
	const base = site instanceof URL ? site : new URL(site ?? 'https://seudominio.com.br');
	return new URL(path, base).href;
}

export function resolveImageUrl(
	image: ImageMetadata | undefined,
	site: URL | string | undefined,
	fallbackSrc: string,
): string {
	const src = image?.src ?? fallbackSrc;
	return absoluteUrl(src, site);
}

export function buildArticleJsonLd(options: {
	title: string;
	description: string;
	imageUrl: string;
	canonicalUrl: string;
	pubDate: Date;
	updatedDate?: Date;
	author?: string;
	authorUrl?: string;
}) {
	const {
		title,
		description,
		imageUrl,
		canonicalUrl,
		pubDate,
		updatedDate,
		author = SITE_AUTHOR,
		authorUrl,
	} = options;

	return {
		'@context': 'https://schema.org',
		'@type': 'Article',
		headline: title,
		description,
		image: [imageUrl],
		datePublished: pubDate.toISOString(),
		dateModified: (updatedDate ?? pubDate).toISOString(),
		author: {
			'@type': 'Person',
			name: author,
			...(authorUrl ? { url: authorUrl } : {}),
		},
		publisher: {
			'@type': 'Organization',
			name: SITE_TITLE,
		},
		mainEntityOfPage: {
			'@type': 'WebPage',
			'@id': canonicalUrl,
		},
	};
}

export function buildBreadcrumbJsonLd(
	items: BreadcrumbItem[],
	site: URL | string | undefined,
) {
	return {
		'@context': 'https://schema.org',
		'@type': 'BreadcrumbList',
		itemListElement: items.map((item, index) => ({
			'@type': 'ListItem',
			position: index + 1,
			name: item.name,
			item: absoluteUrl(item.path, site),
		})),
	};
}

export interface FaqItem {
	question: string;
	answer: string;
}

/**
 * Extrai perguntas e respostas de uma seção de FAQ dentro do corpo Markdown
 * de um artigo. Procura por um H2 contendo "pergunta" (ex: "Perguntas
 * frequentes sobre...") seguido de blocos H3 (pergunta) + parágrafos (resposta).
 *
 * Single source of truth: a mesma seção que o leitor vê no artigo é a que
 * alimenta o schema, evitando divergência entre conteúdo visível e indexado.
 */
export function extractFaqFromMarkdown(rawMarkdown: string): FaqItem[] {
	const faqSectionMatch = rawMarkdown.match(
		/^##\s+.*pergunta.*$([\s\S]*?)(?=^##\s+|\s*$(?![\s\S]))/im,
	);
	if (!faqSectionMatch) return [];

	const faqSection = faqSectionMatch[1];
	const items: FaqItem[] = [];

	// Cada pergunta é um H3; a resposta é o texto até o próximo H3 ou H2.
	const questionBlocks = faqSection.split(/^###\s+/m).slice(1);

	for (const block of questionBlocks) {
		const lines = block.split('\n');
		const question = lines[0]?.trim();
		if (!question) continue;

		const answer = lines
			.slice(1)
			.join('\n')
			.replace(/^##\s+[\s\S]*$/m, '') // corta se um H2 aparecer dentro do bloco
			.replace(/\[([^\]]+)\]\([^)]+\)/g, '$1') // remove links, mantém o texto
			.replace(/\*\*([^*]+)\*\*/g, '$1') // remove bold markdown
			.replace(/[#*_>`]/g, '') // remove marcadores markdown remanescentes
			.trim();

		if (question && answer) {
			items.push({ question, answer });
		}
	}

	return items;
}

export function buildFaqJsonLd(items: FaqItem[]) {
	if (items.length === 0) return null;

	return {
		'@context': 'https://schema.org',
		'@type': 'FAQPage',
		mainEntity: items.map((item) => ({
			'@type': 'Question',
			name: item.question,
			acceptedAnswer: {
				'@type': 'Answer',
				text: item.answer,
			},
		})),
	};
}