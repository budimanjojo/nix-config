{ config, ... }:
{
  config = {
    # Device specific options
    deviceCfg = {
      cpu = "vm";
      gpu = "vm";
      monitors = [
        { name = "Virtual-1"; width = "1280"; height = "800"; }
      ];
      hasBluetooth = false;
      hasSound = false;
      authorizedKeys = [
        "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDIgzLDHHRtLD9DLfNTX8Te9zBcDmEF33UPJ5HngP6aJAhdQln7ebSOzQoehxN0th644G9csnujxjNAStIEUjzeXO1NQQfEYGqDVxDL0jE4hXr1WVg+6GxQnV1nWP5Sd2i24+ElygCdw3KuteeNlfGZ7BKs91zySb03DICXPNcgXj6ZR9INalabFhbjeVG5MRH38KRR9cxZKbgW+eQZZwVtDRPzL7rAfaeeJPg7ZQ3Iu0SC3q5SskGQD5XfqCwPDx9n0GWva36jwNneifv5WFDh0U+xKaoVT4HJTWyV/vf3+fTji1yEsGMBbPexuD5aHvmun9SdgIlGw65GJB7Ibz47Bq/jVfnTV6o5BVDhEfwayHZgahODl5Uyc3VqkKoJh9IWivoBr/bLHXepiJGUReEw61nBc3JL9QC4J5ngterLXP/iapl185+JSvUzDjbtFDHLiXCqa8X17Cm9LSIKik/W7gM2tU63QcQd/p8H55he/Kgm94vWJlq98rjLCtBYTNQDSNAU6AFQqk2c3x23L09wSRIQJ1aUEq6aPx3yfbiRHyTslTyP4tg0I1U1o+jjh9tZV/+JpRcwg9xi9YLoGMAv9aUVGHodjehZw1wHnuql3ALiy/Nnm2LANDh4vhJ2fKsrBqhk8dyDdqFHFsLyTSXUAE4NKGG1AUV3fgMjvRRZZQ==" #work-pc
        "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDJVJ+gHYFCoyd1WG8uJ2d0ErwmyASjhqv8ZXblNBHMjTSNXtqxTZ/MIIAPkxi3XSSFIcAGO7nr5myKyQVfiFlPAQMDR64iTfL6N/peMi25xE5+MhQKTIcJBSlRYx3RjJmx9JwmDuT8aXlPqL16QWk8WVe5XErNAXrsj+PrTISlS9O8wbqKExcC2jTzieg4L3II4cBv+M7QySt8ApzLJ5geYniO4mc5Jqor1hBZakQDw8vJdohOgnjVK+MIvVFm97iVmhNXUCgqFn3EGXVGLAB8J8h2aix8WvkP85WmvJ4nZ9k22QvijBr3WHQdwU/VoZ7xWpXVcGsXwnlD9tpGUotx" #main-pc
        "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDwktTcrOt7pytCS3C8qWg+eRsOjVgEHLJ5iOufmsa6dlmvqYroalwCgvN0YcjoqPdg53S5F12C3voV3nvRhRPB0AEQQYlWEynSFdc/omCktA7NqHcj/Wb/r+52Bq5xVqjXJDLT3f4YCE3pectoaiKgKIS+OoNMOErFmnxO/uSetNrvJLIr6DrxLRW/lZ+xPDiN1eIHM1ETfk9CxIYjD3UztBPAa6qfahchqd64DS8UevLNlvc/SxPniqaZfaxlmk1qMUfvTSPJAcMBSVK2EasHd7tUZhbHvoC+F9723fwtxedTFofgw3iZHWjz8pL7ngFNA4NpyUdDSId3mydPYk0E/rY8WVbknvGlRBjI1OnXWHTOZty26vcoNYKfjP/+1Q3TINVIkvjhNCmS6UuUGfBtqB8uJkUHi4wVYkXLHsK5vUxM664bkeCezHbkR7o17Sa0YbINL510UOi+PLUPEHk98yKh+Xlw77kc0EEQdvmRDTVI+YBmsJ83brtouc2cXm0=" #OP9 termux
      ];
    };

    sops = {
      defaultSopsFile = ./secret.sops.yaml;
      age.keyFile = "/home/${config.deviceCfg.username}/.config/sops/age/keys.txt";
    };
  };
}
