using System;
internal class Program


{
    private static void Main(string[] args)
    {
        var builder = WebApplication.CreateBuilder(args);
        var app = builder.Build();

        app.MapGet("/", () => "Hello World!");
        app.Run();
    }
}


// START AND STOP DATABASE SERVER CONNECTION IN TERMINAL (BASH)
// sudo /usr/local/mysql/support-files/mysql.server start
// sudo /usr/local/mysql/support-files/mysql.server stop

// LOG IN TO DATABASE:
// sudo /usr/local/mysql/bin/mysql -u root -p
// LOG OUT
// Exit or Quit (Maybe followed by ;  if '->' press ctrl + c)

// Name of database: e_commerce_db
// Remember to have "USE e_commerce_db" in other scripts

// Run sql scripts:
// source /Users/alextao/ECommerceProject/ECommerceProject/Database/InsertDummyData.sql

// GIT repository:
// https://github.com/Alexwoko/E_Commerce_Project.git