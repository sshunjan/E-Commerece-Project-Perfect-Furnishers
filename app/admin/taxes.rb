ActiveAdmin.register Tax do
  permit_params :province, :GST, :PST

  index do
    selectable_column
    column :province
    column :PST
    column :GST
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :province
      f.input :PST
      f.input :GST
    end
    f.actions
  end
end
