ActiveAdmin.register Order do
  permit_params :status_type_id, ordered_products_attributes: [:id, :order_id, :product_id]

  index do
    selectable_column
    column :id
    column :user
    column :stripe_cus_id
    column :products do |order|
      order.ordered_products.map {|product| link_to product.product.name, admin_ordered_product_path(product.id) }.join(", ").html_safe
    end
    column :GST
    column :PST
    column :total_price
    column :status_type
    actions defaults: false do |order|
      links = []
      links << link_to('View', admin_order_path(order.id))
      links << link_to('Edit', edit_admin_order_path(order.id))
      links.join("&nbsp;&nbsp;").html_safe
    end
  end

  show do |order|
    attributes_table do
      row :user
      row :stripe_cus_id
      row :products do |order|
        order.ordered_products.map {|product| link_to product.product.name, admin_ordered_product_path(product.id) }.join(", ").html_safe
      end
      row :GST
      row :PST
      row :total_price
      row :status_type
    end
  end

  form do |f|
    f.inputs do
      f.input :status_type
    end
    f.actions
  end
end


