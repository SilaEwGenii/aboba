module ApplicationHelper

    def bootstrap_class_for(name)
        {
            success: "allert-success",
            error: "allert-danger",
            danger: "allert-danger",
            alert: "allert-warning",
            notice: "allert-info"
        }[name.to_sym] || name
    end


end
