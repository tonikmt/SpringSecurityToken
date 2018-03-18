function deletUser(user, x, csrfParameterName, csrfToken) {
    var data = "username=" + user + "&" + csrfParameterName + "=" + csrfToken;
    $.ajax({
        type: "POST",
        url: "/deleteUser",
        data: data,
        success: function (msg) {
            if (msg == "true") {
                $("#tr" + x).remove();
            } else {
                alert('Ошибка удаления, user не найден!');
            }
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


