ActiveAdmin.register Topic do
  permit_params :title, :url_path, :image, :announce,
                :text, :published, tag_ids: []

  form do |f|
    inputs do
      f.input :title
      f.input :url_path
      f.input :image,
              as: :file,
              hint: f.object.image_url.present? ? image_tag(f.object.image_url) : content_tag(:span, 'Загрузите картинку')
      f.input :announce
      f.input :text
      f.input :published, input_html: { disabled: f.object.published }
    end

    inputs do
      #TODO можно подключить https://github.com/platanus/activeadmin_addons/blob/master/docs/select2_tags.md
      f.input :tags, :as => :check_boxes
    end
    f.actions
  end

  controller do
    defaults finder: :find_by_slug
  end
end
