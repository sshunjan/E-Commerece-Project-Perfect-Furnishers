ActiveAdmin.register Category, :as => "Cat" do
  permit_params :name , :description, :icon
end
