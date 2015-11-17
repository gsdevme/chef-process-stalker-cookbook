execute "Process Stalker Install" do
  command "curl -L -o process-stalker https://github.com/gsdevme/process-stalker/releases/download/0.1.1/process-stalker.sh && chmod +x process-stalker && mv process-stalker /usr/local/bin/."
  action :run
end

template "process-stalker.conf.erb" do
  path "/etc/process-stalker.conf"
  source "process-stalker.conf.erb"
  variables :processes => node['process-stalker']['processes']
  owner "root"
  group "root"
  mode "0775"
end
