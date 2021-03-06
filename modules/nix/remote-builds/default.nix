{ config, pkgs, ... }:

{
  nix = {
    # Use substitutes when using remote builders as they'll usually have more
    # consistent internet connections.
    extraOptions = ''
      builders-use-substitutes = true
    '';

    buildMachines = [
      {
        hostName = "mir.local";
        system = "x86_64-linux";
        maxJobs = 24;
        speedFactor = 3;
        supportedFeatures = [ "nixos-test" "benchmark" "big-parallel" "kvm" ];
        mandatoryFeatures = [ ];
      }
      {
        hostName = "salzburg.local";
        system = "x86_64-linux";
        maxJobs = 8;
        speedFactor = 3;
        supportedFeatures = [ "benchmark" "big-parallel" "nixos-test" "kvm" ];
        mandatoryFeatures = [ ];
      }
      {
        hostName = "berlin.infra.hormonal.party";
        system = "x86_64-linux";
        maxJobs = 12;
        speedFactor = 2;
        supportedFeatures = [ "nixos-tests" "benchmark" "big-parallel" ];
        mandatoryFeatures = [ ];
      }
    ];

    distributedBuilds = true;
  };
}
