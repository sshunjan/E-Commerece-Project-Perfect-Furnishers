ActiveAdmin.register StatusType, :as => "Status Options" do
  permit_params :name, :visible
end
