<!DOCTYPE html>
<html lang="en">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
              integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
              integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
        </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-md-offset-3">
                    <div class="panel panel-default" style="margin-top:45px">
                        <div class="panel-heading">
                            <h3 class="panel-title">Enter new user data</h3>
                            </div>
                        <div class="panel-body">
                            <form method="post" action="/addNewUser">
                                <input name="${_csrf.parameterName}" value="${_csrf.token}" type="hidden">
                                <div class="form-group">
                                    <label for="username">Login</label>
                                    <input type="text" class="form-control" id="username" placeholder="Login"
                                           name="username">
                                    </div>
                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <input type="password" class="form-control" id="password" placeholder="Password"
                                           name="password">
                                    </div>
                                <div class="form-group">
                                    <label for="role">Role select</label>
                                    <select class="form-control" id="role" name="role">
                                        <option>USER</option>
                                        <option>ROOT</option>
                                        </select>
                                    </div>
                                <div class="form-group">
                                    <label for="name">Name user</label>
                                    <input type="text" class="form-control" id="name" placeholder="Name for user"
                                           name="name">
                                    </div>
                                <div class="form-group">
                                    <label for="email">Email address</label>
                                    <input type="email" class="form-control" id="email" name="email" placeholder="name@domen.ru">
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