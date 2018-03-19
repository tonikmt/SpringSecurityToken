<!DOCTYPE html>
<html>
    <head>
        <title>Users</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
        <script src="\js\main.js"></script>
        </head>
    <body>
        <nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand">Users</a>
                    </div>
                <ul class="nav navbar-nav">
                    <li><a href="/">Home</a></li>
                    <li class="active"><a href="/Users">Users List</a></li>
                    <li><a href="/addUser">Add User</a></li>
                    </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="/logout">Exit</a></li>
                    </ul>
                </div>
            </nav>
        <div class="container" style="margin-top:100px">
            <div class="panel panel-default">
                <table id="table" class="table table-hover">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Login</th>
                            <th scope="col">Name</th>
                            <th scope="col">Role</th>
                            <th scope="col">email</th>
                            <th scope="col">Account Non Expired</th>
                            <th scope="col">Account Non Locked</th>
                            <th scope="col">Credentials Non Expired</th>
                            <th scope="col">Enabled</th>
                            <th scope="col">Delete</th>
                            <th scope="col">Edit</th>
                            </tr>
                        </thead>
                    <tbody>
                    <#assign x=1>
                    <#list users as user>
                        <tr id="tr${x}">
                            <th scope="row">${x}</th>
                            <td>${user.getUsername()}</td>
                            <td>${user.getName()}</td>
                            <td> 
                            <#list user.getAuthorities() as role>
                                ${role.getAuthority()}
                            </#list> 
                                </td>
                            <td>${user.getEmail()}</td>
                            <#if user.isAccountNonExpired()>
                            <td>Yes</td>
                            <#else>
                            <td>No</td>
                            </#if>
                            <#if user.isAccountNonLocked()>
                            <td>Yes</td>
                            <#else>
                            <td>No</td>
                            </#if>
                            <#if user.isCredentialsNonExpired()>
                            <td>Yes</td>
                            <#else>
                            <td>No</td>
                            </#if>
                            <#if user.isEnabled()>
                            <td>Yes</td>
                            <#else>
                            <td>No</td>
                            </#if>
                            <td><button type="button" class="btn btn-danger" onclick="deletUser('${user.getUsername()}', '${_csrf.parameterName}', '${_csrf.token}')" id="buttonDel"/>Del</button></td>
                            <td><button type="button" class="btn btn-primary" onclick="editUser('${user.getUsername()}', '${_csrf.parameterName}', '${_csrf.token}')" id="buttonEdit"/>Edit</button></td>
                            </tr>
                        <#assign x=x+1>
                    </#list>
                        </tbody>
                    </table>
                </div>
            </div>
        
        </body>
    </html>
