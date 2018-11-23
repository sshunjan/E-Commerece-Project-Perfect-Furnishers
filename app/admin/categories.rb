ActiveAdmin.register Category, :as => "Section" do
  permit_params :name , :description, :icon
end
