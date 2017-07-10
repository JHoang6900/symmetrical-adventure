module DefaultPageContentTitle
extend ActiveSupport::Concern

  included do
  before_filter :set_title
end
  
  def set_title
    @page_title = "Devcamp Portfolio | My Portfolio Website"
    #SEO = Search Engine Optimization Keywords
    @seo_keywords = "Jeffrey Hoang Portfolio"
  end
end