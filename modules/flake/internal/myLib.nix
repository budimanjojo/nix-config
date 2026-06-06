{ self, lib, ... }:
{
  _module.args.myLib = import "${self}/lib" { inherit lib; };
}
