<!DOCTYPE html>
<html>
    <head>
        <title>Users</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <!-- Optional theme -->
        <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        </head>

    <script>
    
    function deletUser(user, x) {
        var data = "username="+user+"&"+"${_csrf.parameterName}"+"="+"${_csrf.token}";
      $.ajax({
      type: "POST",
      url: "/deleteUser",
      data: data,
      success: function(msg){
          if (msg == "true") {
               $("#tr"+x).remove();
              } else {
                    alert('Error!!!');
                }
        }
    });
    }
        </script>
    <body>
        <div class="container" margin-top="50px">
            <div class="panel panel-default" style="margin-top:45px">
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
                            <td><input type="button" onclick="deletUser('${user.getUsername()}', ${x})" id="button" value="Delet"/></td>
                            </tr>
                        <#assign x=x+1>
                    </#list>

                        </tbody>
                    </table>
                </div>
            </div>
        </body>
    </html>
