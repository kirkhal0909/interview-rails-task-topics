ActiveAdmin.register Tag do
  permit_params :name

  form do |f|
    inputs do
      f.input :name
    end
    f.actions
  end
end
