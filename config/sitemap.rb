# Wiki: https://github.com/kjvarga/sitemap_generator

# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = 'http://azartwiki.com'

SitemapGenerator::Sitemap.public_path   = 'tmp/'
SitemapGenerator::Sitemap.sitemaps_path = ''
SitemapGenerator::Sitemap.create_index = true
SitemapGenerator::Sitemap.namer   = SitemapGenerator::SimpleNamer.new(:sitemap, zero: '_index')
SitemapGenerator::Sitemap.adapter = SitemapGenerator::WaveAdapter.new
SitemapGenerator::Sitemap.ping_search_engines(yandex: 'http://webmaster.yandex.ru/sitemaptest.xml?host=azartwiki.com')
# SitemapGenerator::Sitemap.sitemaps_host = "http://s3.amazonaws.com/sitemap-generator/"

SitemapGenerator::Sitemap.create do
  add root_path, lastmod: Date.today, expires: 1.days.from_now
end

# Not needed if you use the rake tasks
# SitemapGenerator::Sitemap.ping_search_engines
