module FrontpageHelper

  def base_article_type(base_article)
    if base_article.is_a? CommentArticle
      "Kommentar"
    else
      "Artikkel"
    end
  end

  def base_article_url(base_article)
    puts base_article.id
    if base_article.is_a? CommentArticle
      comment_article_path(base_article)
    else
      news_article_path(base_article)
    end
  end
end
