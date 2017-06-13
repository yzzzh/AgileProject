/**
 * Created by YZH on 2017/6/10.
 */
$(document).ready(function () {
    $(".form-control").bind('keydown',function () {
        if(keyCode == 13){
            var schname = document.getElementsByClassName("form-control");
            Location.href = '/' + pageName + '/' + schname;
        }
    })
});