class AddIntialFieldsToSnippet < ActiveRecord::Migration
  def change
    add_column :snippets, :title, :string
    add_column :snippets, :desc, :text
    add_column :snippets, :code, :text
  end
end
