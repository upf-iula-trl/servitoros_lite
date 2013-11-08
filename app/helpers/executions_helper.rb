module ExecutionsHelper

  def execution_status_class(execution)
    case execution.status
    when :running  then "label-info"
    when :finished  then "label-success"
    when :error then "label-important"
    end
  end

  def execution_status_name(execution)
    return execution.status.to_s.humanize unless execution.initialized?
    "In progress"
  end

end
