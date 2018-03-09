class DashboardController < ApplicationController
  layout 'admin'
  def index
    # counts = Article.select('articles.id,count(case when draft=true then true end) as drafts, count(articles.id) as all').first
    # puts counts
    # drafts = counts.drafts.to_i
    # all = counts.all.to_i

    # Bu sorgu ile alındığı zaman db ye iki ayrı sorgu yapmış oluyoruz.
    # @articles = Article.all
    # @dashboard_data = Dashboard.new
    # @dashboard_data.draft_article_count = @articles.where(draft: true).size
    # @dashboard_data.total_article_count = @articles.size
    # @dashboard_data
    #

    # Bu haliyle tek sorguda iki farklı count değeri alabiliyoruz.
    draft_counts = Article.unscoped.group(:draft).count(:id)
    @dashboard_data = Dashboard.new
    @dashboard_data.draft_article_count = draft_counts[true].to_i
    @dashboard_data.total_article_count = draft_counts[true].to_i + draft_counts[false].to_i
    @dashboard_data
  end
end