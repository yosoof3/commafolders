let
  database = "stardust";
in
{
  users.groups.${database} = { };
  users.users.${database} = {
    group = database;
    isSystemUser = true;
  };
  services.postgresql = {
    ensureDatabases = [ "${database}" ];
    ensureUsers = [
      {
        name = "${database}";
        ensureDBOwnership = true;
      }
    ];
    identMap = ''
      # ArbitraryMapName systemUser DBUser
         superuser_map      yusof   ${database}
    '';
  };
}
