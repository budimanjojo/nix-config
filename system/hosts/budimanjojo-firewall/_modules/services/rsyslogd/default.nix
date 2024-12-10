{ config, ... }:
{
  services = {
    journald.forwardToSyslog = true;
    rsyslogd = {
      enable = true;
      defaultConfig = ''
        # for some reason rsyslog shows the hostname as "localhost" which is not helpful
        global(localHostname="${config.networking.hostName}")

        # TOOD: the options are needed because of how `vector` is setup in my kubernetes cluster
        # I will remove them once I updated the vector part
        module(load="imklog" ParseKernelTimestamp="on" KeepKernelTimestamp="on")

        kern.warning @@(o)192.168.15.5:6000;RSYSLOG_SyslogProtocol23Format
      '';
    };
  };
}
