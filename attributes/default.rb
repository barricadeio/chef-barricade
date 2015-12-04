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
default['barricade']['barricade_key']  = "YOUR_BARRICADE_KEY"
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
# Docs:      https://docs.barricade.io/help_center/platform/tags
#
default['barricade']['tags']           = "production, chef"


##########################################################################
# These are the slightly more advanced settings for the                  #
# barricade agent. We recommend not changing them unless you really      #
# know what you are doing :-) Feel free to ask us for more information.  #
##########################################################################
#
# Parameter: protocols
# Value:     A list of protocols to intercept. In the event where a protocol
#            needs to be removed or added, it can be done here.
# Default:   Ethernet,IP,IPv6,DNS,UDP,TCP,ICMP,ICMPv6,IGMP,ARP,HTTP,Raw
# Note:      The engine will gracefully handle and learn from any existing
#            protocol information sent to it.
#
default['barricade']['protocols']      = "Ethernet,IP,IPv6,DNS,UDP,TCP,ICMP,ICMPv6,IGMP,ARP,HTTP,Raw"

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
default['barricade']['filter']   =  ""

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
default['barricade']['loglevel'] =  "error"

#
# Parameter: flush_frequency
# Value:     How often (in seconds) events should be send to the collector.
#            Events are batched together to make the traffic output more uniformly
#            distributed for varying ingress. The more frequently data is flushed,
#            the more up to date a picture of your network Barricade has.
# Default:   1
# 
default['barricade']['flush_frequency'] = "1"

#
# Parameter: concurrency
# Value:     The number of worker processes to spawn for sending data to the collector.
#            This should be tuned with the `flush_frequency` option as each worker will
#            update concurrently. So a concurrency of 10 and a flush_frequency of 1 will
#            mean 10 updates per second in total to the collector.
# Default:   1
#
default['barricade']['concurrency'] = "1"

#
# Parameter: high_water_mark
# Value:     Maximum number of events to queue before dropping events.
#            This is to prevent inundating your server with requests to Barricade under unusual traffic conditions.
#            The default is tuned very high so as not to drop events most of the time, but you may need to change this
#            depending on your traffic profile.
#            If the logs contain warnings about the "high_water_mark" being passed, you may need to adjust this setting,
#            or investigate if this seems like unusually high traffic.
#
# Default:   10000
#
default['barricade']['high_water_mark'] = "10000"

#
# Parameter: api_host
# Value:     Barricade API host.
#            The agent communicates to this API to retrieve information like whether the agent should be enabled or disabled, etc.
#
# Default:   app.barricade.io
#
default['barricade']['api_host'] = "app.barricade.io"
