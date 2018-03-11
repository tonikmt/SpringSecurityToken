<!DOCTYPE html>
<html lang="en">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <!-- Optional theme -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-md-offset-3">
                    <div class="panel panel-default" style="margin-top:100px">
                        <div class="panel-heading">
                            <h3 class="panel-title">Enter new user data</h3>
                            </div>
                        <div class="panel-body">
                            <form method="post" action="/addUser?save">
                                <input name="${_csrf.parameterName}" value="${_csrf.token}" type="hidden">

                                    <#if errors == "true">
                                <div class="form-group">
                                    <label for="username">Login</label>
                                    <input type="text" class="form-control is-invalid" id="username" placeholder="Login" 
                                           name="username">
                                    <div class="invalid-feedback">
                                        Please choose a username.
                                        </div>
                                    </div>  
                                    <#elseif errors == "false">
                                <div class="form-group">
                                    <label for="username">Login</label>
                                    <input type="text" class="form-control" id="username" placeholder="Login" 
                                           name="username">
                                    </div>  
                                <#else>
                                <div class="form-group">
                                    <label for="username">Login</label>
                                    <input type="text" class="form-control is-valid" id="username" placeholder="Login" 
                                           name="username">
                                    <div class="valid-feedback">
                                        UserName is OK!
                                        </div>
                                    </div>  
                                    </#if>

                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <input type="password" class="form-control" id="password" placeholder="Password"
                                           name="password">
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
                                    </div>

                                <div class="form-group">
                                    <label for="email">Email address</label>
                                    <input type="email" class="form-control" id="email" name="email" placeholder="name@domen.ru">
                                    </div>

                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="accountNonExpired" name="accountNonExpired">
                                    <label class="form-check-label" for="exampleCheck1">Account Non Expired</label>
                                    </div>
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="accountNonLocked" name="accountNonLocked">
                                    <label class="form-check-label" for="exampleCheck1">Account Non Locked</label>
                                    </div>
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="credentialsNonExpired" name="credentialsNonExpired">
                                    <label class="form-check-label" for="exampleCheck1">Credentials Non Expired</label>
                                    </div>
                                <div class="form-check">
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