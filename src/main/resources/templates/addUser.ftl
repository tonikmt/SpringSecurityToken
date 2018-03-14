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
                    <li class="active"><a href="/addUser">Add User</a></li>
                    </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="/logout">Exit</a></li>
                    </ul>
                </div>
            </nav>
        <div class="container" style="margin-top:100px">
            <div class="row">
                <div class="col-md-6 col-md-offset-3">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">Enter new user data</h3>
                            </div>
                        <div class="panel-body">
                            <form method="post" action="/addUser?save">
                                <input name="${_csrf.parameterName}" value="${_csrf.token}" type="hidden">
                                <div class="form-group">
                                    <label for="username">Login</label>
                                    <input type="text" class="form-control" id="username" placeholder="Login" 
                                           name="username">
                                    <#if username == "true">
                                    <span class="label label-danger">${usernameMess}</span>
                                    </#if>
                                    </div>
                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <input type="password" class="form-control" id="password" placeholder="Password"
                                           name="password">
                                    <#if password == "true">
                                    <span class="label label-danger">${passwordMess}</span>
                                    </#if>
                                    </div>
                                <div class="form-group">
                                    <label for="role">Role select</label>
                                    <select class="form-control" id="authorities" name="authorities">
                                        <option>USER</option>
                                        <option>ADMIN</option>
                                        </select>
                                    </div>
                                <div class="form-group">
                                    <label for="name">Name user</label>
                                    <input type="text" class="form-control" id="name" placeholder="Name for user"
                                           name="name">
                                    <#if name == "true">
                                    <span class="label label-danger">${nameMess}</span>
                                    </#if>
                                    </div> 
                                <div class="form-group">
                                    <label for="email">Email address</label>
                                    <input type="email" class="form-control" id="email" name="email" placeholder="name@domen.ru">
                                    <#if email == "true">
                                    <span class="label label-danger">${emailMess}</span>
                                    </#if>
                                    </div>
                                <div class="form-group">
                                    <input type="checkbox" class="form-check-input" id="accountNonExpired" name="accountNonExpired">
                                    <label class="form-check-label" for="exampleCheck1">Account Non Expired</label>
                                    </div>
                                <div class="form-group">
                                    <input type="checkbox" class="form-check-input" id="accountNonLocked" name="accountNonLocked">
                                    <label class="form-check-label" for="exampleCheck1">Account Non Locked</label>
                                    </div>
                                <div class="form-group">
                                    <input type="checkbox" class="form-check-input" id="credentialsNonExpired" name="credentialsNonExpired">
                                    <label class="form-check-label" for="exampleCheck1">Credentials Non Expired</label>
                                    </div>
                                <div class="form-group">
                                    <input type="checkbox" class="form-check-input" id="enabled" name="enabled">
                                    <label class="form-check-label" for="exampleCheck1">Enabled</label>
                                    </div>
                                <button type="submit" class="btn btn-primary">add User</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </body>
    </html>