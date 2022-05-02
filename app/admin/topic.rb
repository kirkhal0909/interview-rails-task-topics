ActiveAdmin.register Topic do
  permit_params :title, :url_path, :image, :announce,
                :text, :published, tag_ids: []

  form do |f|
    inputs do
      f.input :title
      f.input :url_path
      f.input :image, :as => :file, :hint => image_tag(f.object.image.url) 
      f.input :announce
      f.input :text
      f.input :published
    end

    inputs do
      #TODO можно подключить https://github.com/platanus/activeadmin_addons/blob/master/docs/select2_tags.md
      f.input :tags, :as => :check_boxes
    end
    f.actions
  end
end
