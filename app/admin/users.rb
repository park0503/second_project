ActiveAdmin.register User do
  permit_params :title, :body, :author
end
