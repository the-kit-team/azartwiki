# Wiki: https://github.com/kjvarga/sitemap_generator
# Instruction https://github.com/kjvarga/sitemap_generator/wiki/Generate-Sitemaps-on-read-only-filesystems-like-Heroku

# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host  = 'http://azartwiki.com'
SitemapGenerator::Sitemap.public_path   = 'tmp/'
SitemapGenerator::Sitemap.create_index  = true
SitemapGenerator::Sitemap.namer         = SitemapGenerator::SimpleNamer.new(:sitemap, zero: '_index')
SitemapGenerator::Sitemap.adapter       = SitemapGenerator::S3Adapter.new
SitemapGenerator::Sitemap.sitemaps_host = "http://#{ENV['FOG_DIRECTORY']}.s3.amazonaws.com/"
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'
SitemapGenerator::Sitemap.ping_search_engines(yandex: 'http://webmaster.yandex.ru/sitemaptest.xml?host=azartwiki.com')

SitemapGenerator::Sitemap.create do
  add root_path, lastmod: Date.today
end
