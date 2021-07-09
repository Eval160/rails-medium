class MigrateBodytoRichContentArticles < ActiveRecord::Migration[6.0]
  def up
    Article.find_each do |article|
      article.update(rich_content: article.content)
    end
  end

  def down
    Article.find_each do |article|
      article.update(content: article.rich_content)
      article.update(rich_content: nil)
    end
  end
end
