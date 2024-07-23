unit Config.Database;

interface

type
  TDatabaseConfig = class
    private
      FDBName: string;
      FDBUser: string;
      FDBPassword: string;
      FDBPort: string;
      FDBServer: string;
      FVendorPath: string;
    public
      property DBName: string read FDBName write FDBName;
      property DBUser: string read FDBUser write FDBUser;
      property DBPassword: string read FDBPassword write FDBPassword;
      property DBPort: string read FDBPort write FDBPort;
      property DBServer: string read FDBServer write FDBServer;
      property VendoPath: string read FVendorPath write FVendorPath;

  end;


implementation

end.
