class Chef
  class Provider
    class Package
      class TdRubygems < Chef::Provider::Package::Rubygems

        class TdGemEnvironment < AlternateGemEnvironment
        end

        def initialize(new_resource, run_context = nil)
          super
          gem_binary_path = new_resource.gem_binary.empty? ? td_gem_binary_path : new_resource.gem_binary
          @new_resource.gem_binary gem_binary_path
          @new_resource.package_name td_plugin_name if @new_resource.plugin
          @gem_env = TdGemEnvironment.new(gem_binary_path)
          Chef::Log.debug("#{@new_resource} using gem '#{gem_binary_path}'")
        end

        def td_plugin_name
          "fluent-plugin-#{@new_resource.package_name}"
        end

        def td_gem_binary_path
          if node['platform_family'] == "rhel" && node[:kernel][:machine] == "x86_64"
            "/usr/lib64/fluent/ruby/bin/fluent-gem"
          end
        end
      end
    end
  end
end
