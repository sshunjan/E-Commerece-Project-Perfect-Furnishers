ActiveAdmin.register Product do
    permit_params :name, :description, :category_id, :price, :image, :status_type_id
end
