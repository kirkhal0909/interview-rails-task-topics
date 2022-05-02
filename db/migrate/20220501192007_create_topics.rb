class CreateTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :topics do |t|
      t.string :title, null: false
      t.string :slug
      t.string :url_path, null: false
      t.string :image
      t.string :announce
      t.string :text, null: false
      t.boolean :published, default: false
      t.datetime :published_at

      t.index :title
      t.index :published_at
      t.index [:url_path, :slug]
      t.timestamps
    end

    create_table :tags_topics do |t|
      t.references :topic, null: false
      t.references :tag, null: false
      t.index [:topic_id, :tag_id], unique: true
    end

    execute "Select nextval('topics_id_seq')" # init sequencer (postgresql). It need for slug in topics before save
  end
end
