function deletUser(user, csrfParameterName, csrfToken) {
    var data = "username=" + user + "&" + csrfParameterName + "=" + csrfToken;
    $.ajax({
        type: "POST",
        url: "/deleteUser",
        data: data,
        success: function (msg) {
           // if (msg == "") {
                document.open();
                document.write(msg);
                document.close();
                //$("#tr" + x).remove();
            
        },
        error: function (request, status, error) {
            //alert(request.responseText);
            //    alert(request.status);
            document.open();
            document.write(request.responseText);
            document.close();
        }
    });
}
function editUser(user, csrfParameterName, csrfToken) {
    var data = "username=" + user + "&" + csrfParameterName + "=" + csrfToken;
     $.ajax({
        type: "POST",
        url: "/editUser",
        data: data,
        success: function (msg) {
           // if (msg == "") {
                document.open();
                document.write(msg);
                document.close();
                //$("#tr" + x).remove();
            
        },
        error: function (request, status, error) {
            //alert(request.responseText);
            //    alert(request.status);
            document.open();
            document.write(request.responseText);
            document.close();
        }
    });
}


