ActiveAdmin.register Tag do
  permit_params :name

  form do |f|
    inputs do
      f.input :name
    end
    f.actions
  end

  controller do
    defaults finder: :find_by_slug
  end
end
