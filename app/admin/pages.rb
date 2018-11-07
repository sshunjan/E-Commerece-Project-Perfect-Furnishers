ActiveAdmin.register Page do
  permit_params :title, :content, :permalink

  form do |f|
    f.inputs do
      f.input :title
      f.input :content, as: :froala_editor
      f.input :permalink
    end

    f.actions
  end
end
