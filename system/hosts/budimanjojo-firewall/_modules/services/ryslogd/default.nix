{ ... }:
{
  services = {
    journald.forwardToSyslog = true;
    rsyslogd = {
      enable = true;
      defaultConfig = ''
        kern.warning @@(o)192.168.15.5:6000;RSYSLOG_SyslogProtocol23Format
      '';
    };
  };
}
