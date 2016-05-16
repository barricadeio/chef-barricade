# The Barricade.io configuration options for the agent.
#
# Your automation key (:barricade_key) can be retrieved from your team
# page located the following URL:
#   - https://app.barricade.io/dashboard/settings/team/profile
   


#
# Parameter: license_key
# Value:     A 40-character hexadecimal string provided by Barricade.io. This
#            parameter is required for all transactions and in order for the
#            security monitor to start.
#
default['barricade']['barricade_key'] = "YOUR_BARRICADE_KEY"
default['barricade']['install_script'] = "https://app.barricade.io/install/#{node['barricade']['barricade_key']}/install.sh"

#
# Parameter: tag
# Value:     An arbitrary scalar value that will be used by you and your
#            team to effectively "tag" results sent to the Barricade platform.
#
#            This can be used to tag "development, staging, production" environments,
#            "commit" versions, it could be dates, etc.
#
#            Set multiple tags by comma-separating them.
#
# Default:   production
# Docs:      http://docs.barricade.io/using-barricade/#configuring-agents
#
default['barricade']['tags'] = ["production", "chef"]


##########################################################################
# These are the slightly more advanced settings for the                  #
# barricade agent. We recommend not changing them unless you really      #
# know what you are doing :-) Feel free to ask us for more information.  #
##########################################################################

#
# Parameter: filter
# Value:     The default network filter which is compatible with libpcap's
#            format (i.e. "port not 53 and port not 22" to stop listening for
#            DNS and SSH requests.
# Warning:   Stopping the collection of services means that attacks on said services
#            will not be detected.
#
#
# filter=port not 22
#
default['barricade']['filter'] =  ""

#
# Parameter: loglevel
# Value:     The level of logging information about the agent to store.
#            The possible values are broken down as follow:
#                error        -> Show errors only
#                warning      -> Show errors and warnings
#                info         -> Show additional information messages
#                verbose      -> Show detailed information messages
#                debug        -> Show agent-debug messages
#                verbosedebug -> Show very detailed agent-level debug messages
# Default:   error
#
default['barricade']['loglevel'] = "error"

#
# Parameter: flush_frequency
# Value:     How often (in seconds) events should be send to the collector.
#            Events are batched together to make the traffic output more uniformly
#            distributed for varying ingress. The more frequently data is flushed,
#            the more up to date a picture of your network Barricade has.
# Default:   1
# 
default['barricade']['flush_frequency'] = "0.5"

#
# Parameter: spooler_memory
# Value:     Amount of system memory (in MB) to use for buffering data.
#            This controls how much memory is used to buffer packets for sending to Barricade.
#
# Default:   64
#
# spooler_memory=64
default['barricade']['spooler_memory'] = "64"

#
# Parameter: api_host
# Value:     Barricade API host.
#            The agent communicates to this API to retrieve information like whether the agent should be enabled or disabled, etc.
#
# Default:   https://app.barricade.io
#
default['barricade']['api_host'] = "https://app.barricade.io/api"

#
# Parameter: cache_directory
# Value:     Directory to use to temporarily store packet data before forwarding to Barricade.
#            Consider setting this to a tmpfs backed partition if running on a high traffic server
#            that does not use SSD.
#
# Default:   /opt/barricade/cache
#
# cache_directory=/opt/barricade/cache
default['barricade']['cache_directory'] = ""

#
# Parameter: cache_ttl
#
# Value:     How long (in seconds) to store data in cache before dropping it in favour of more recent data.
#            On compute constrained servers, keeping this low prevents a high load event from disproportionately
#            affecting performance, but does mean some traffic data will not be sent to Barricade.
#
# Default:   10
#
# cache_ttl=10
default['barricade']['cache_ttl'] = ""

#
# Parameter: private_ip
#
# Value:     Private IP of the server the agent is hosted on.
#            Autodetected.
#
# Default:   <Autodetected>
#
# private_ip=
default['barricade']['private_ip'] = ""

#
# Parameter: public_ip
#
# Value:     Resolved public IP of the server the agent is hosted on.
#            If traffic is routed through a gateway, this may be different
#            to the actual IP.
#            Autodetected.
#
# Default:  <Autodetected>
#
# public_ip=
default['barricade']['public_ip'] = ""

#
# Parameter: collector_host
# Value:     The domain name of the Barricade collector hostname to connect to. Changing
#            this value, unless advised by a member of Barricade is likely to result in a
#            loss of data if the hostname is not properly configured.
# Default:   collect.barricade.io
#
default['barricade']['collector_host'] = ""

#
# Parameter: collector_port
# Value:     The collector port to connect to.
# Default:   443
# collector_port=443
default['barricade']['collector_port'] = ""
