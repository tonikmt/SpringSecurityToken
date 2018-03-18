<!DOCTYPE html>
<html lang="en">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
            <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
        </head>
    <body>
        <nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand">Users</a>
                    </div>
                <ul class="nav navbar-nav">
                    <li><a href="/">Home</a></li>
                    <li><a href="/Users">Users List</a></li>
                    <li><a href="/addUser">Add User</a></li>
                    </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="/logout">Exit</a></li>
                    </ul>
                </div>
            </nav>
        <div class="container" style="margin-top:100px">
            <div class="row">
                <div class="col-md-12">
                    <#if isError == "true">
                    <div class="alert alert-danger" role="alert">
                        <h1 class="alert-heading">${heder}</h4>
                        <#list errors as error>
                        <h3>#Reason: ${error}</h3>
                        </#list>
                        </div>
                    </#if>
                    </div>
                </div>
            </div>
        </body>
    </html>
