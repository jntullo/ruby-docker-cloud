module DockerCloud
  class Service < DockerCloud::Type
    def resource_uri; info[:resource_uri]; end
    def image_name; info[:image_name]; end
    def name; info[:name]; end
    def public_dns; info[:public_dns]; end
    def state; info[:state]; end
    def net; info[:net]; end
    def pid; info[:pid]; end
    def synchronized; info[:synchronized]; end
    def deployed_date; info[:deployed_datetime]; end
    def started_date; info[:started_datetime]; end
    def stopped_date; info[:stopped_datetime]; end
    def destroyed_date; info[:destroyed_datetime]; end
    def target_container_num; info[:target_num_containers]; end
    def current_num_containers; info[:current_num_containers]; end
    def running_num_containers; info[:running_num_containers]; end
    def stopped_num_containers; info[:stopped_run_containers]; end
    # TODO: Get the Stack
    def stack; info[:stack]; end
    # TOOD: GET THE CONTAINERS
    def containers; info[:containers]; end
    def container_ports; @container_ports ||= ContainerPorts.new(info[:container_ports]); end
    def container_env_vars; info[:container_envvars]; end
    def labels; info[:labels]; end
    def working_dir; info[:working_dir]; end
    def user; info[:user]; end
    def hostname; info[:hostname]; end
    def domain_name; info[:domainname]; end
    def amc_address; info[:mac_address]; end
    def cgroup_name; info[:cgroup_name]; end
    def tty; info[:tty]; end
    def stdin_open; info[:stdin_open]; end
    def dns; info[:dns]; end
    def dns_search; info[:dns_search]; end
    def cap_add; info[:cap_add]; end
    def cap_drop; info[:cap_add]; end
    def devices; info[:devices]; end
    def extra_hosrs; info[:extra_hosrs]; end
    def security_opt; info[:security_opt]; end
    def entrypoint; info[:entrypoint]; end
    def run_command; info[:run_command]; end
    def sequential_deployment; info[:sequential_deployment]; end
    def cpu_shares; info[:cpu_shares]; end
    def cpuset; info[:cpuset]; end
    def memory; info[:memory]; end
    def memory_swap; info[:memory_swap]; end
    def linked_from_service; info[:linked_from_service]; end
    def linked_to_service; info[:linked_to_service]; end
    def bindings; info[:bindings]; end
    def auto_restart; info[:autorestart]; end
    def auto_destroy; info[:autodestroy]; end
    def roles; info[:roles]; end
    def link_variables; info[:link_variables]; end
    def privileged; info[:privileged]; end
    def read_only; info[:read_only]; end
    def deployment_strategy; info[:deployment_strategy]; end
    def tags; info[:tags]; end
    def auto_redeploy; info[:autoredeploy]; end
    def nickname; info[:nickname]; end
  end
end