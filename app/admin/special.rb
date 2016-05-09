ActiveAdmin.register Special do
 extend I18n
 menu parent: I18n.t("Blog"), label: I18n.t("Special")

 permit_params :title

end
