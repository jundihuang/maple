ActiveAdmin.register Classification do
 menu parent: I18n.t("Blog"), label: I18n.t("Classification")

 permit_params :title

end
